#!/usr/bin/env python3
import datetime
import html
import re
import os
import shutil
import subprocess
import sys

import lxml.etree as ET
from xml.sax.saxutils import escape as xml_escape

from flask import Flask
from flask import request


app = Flask(__name__)
PUBLIC_URL = os.environ.get('PUBLIC_URL', 'https://apt.example.com')
UPLOAD_FOLDER = os.environ.get(
    'UPLOAD_FOLDER', os.path.expanduser('~/.aptly/upload'))
MAX_ITEMS = 100
ATOM_FEED = os.environ.get(
    'ATOM_FEED', os.path.expanduser('~/.aptly/public/feed.xml'))
ALLOWED_EXTENSIONS = set([
    'changes', 'dsc', 'xz', 'gz', 'bz2', 'buildinfo', 'deb'])

try:
    os.makedirs(UPLOAD_FOLDER)
except FileExistsError:
    pass


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


BASE_FEED = f"""<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
    <title>Packages from {PUBLIC_URL}</title>
    <link href="{PUBLIC_URL}/feed.xml" rel="self" type="application/rss+xml" />
    <link href="{PUBLIC_URL}"></link>
    <updated>2019-12-09T04:01:19Z</updated>
    <id>{PUBLIC_URL}/feed.xml</id>
</feed>"""

ENTRY_TEMPLATE = """<entry>
<title type="text">{package} uploaded to {distribution}</title>
<author>
  <name>{name}</name>
  <email>{email}</email>
</author>
<link href="{id}"></link>
<id>{id}</id>
<updated>{updated}</updated>
<published>{published}</published>
<content type="html">{content}</content>
</entry>"""

if not os.path.exists(ATOM_FEED):
    with open(ATOM_FEED, 'w') as f:
        f.write(BASE_FEED)


def add_feed_entry(package, content):
    name = distribution = None
    for line in content.splitlines():
        if line.startswith('Changed-By: '):
            name, email = re.match(r'^Changed-By: (.*) <(.*)>$', line).groups()
        elif line.startswith('Distribution: '):
            distribution = line.split(':', 1)[1]
        if name and distribution:
            break
    if not name or not distribution:
        print(f'unable to parse name or distribution for {package}',
              file=sys.stderr)
        return
    feed = ET.parse(ATOM_FEED)
    ns = {'atom': 'http://www.w3.org/2005/Atom'}
    root = feed.getroot()
    now = datetime.datetime.utcnow().isoformat('T') + "Z"
    root.find('atom:updated', namespaces=ns).text = now
    first = root.find('atom:entry', namespaces=ns)
    if first is None:
        index = -1
    else:
        index = root.index(first)
    pkg = package.split('_', 1)[0]
    entry = ET.XML(ENTRY_TEMPLATE.format(
        name=xml_escape(name),
        email=xml_escape(email),
        package=xml_escape(package),
        content=html.escape('<pre>{}</pre>'.format(html.escape(content))),
        distribution=xml_escape(distribution),
        updated=now,
        published=now,
        id=f'{PUBLIC_URL}/pool/main/{pkg[0]}/{pkg}/?p={package}',
    ))
    root.insert(index, entry)
    for old in root.xpath(
        f'atom:entry[position()>{MAX_ITEMS:d}]', namespaces=ns
    ):
        old.getparent().remove(old)
    feed.write(ATOM_FEED, pretty_print=True)


def upload_file(request, filename, repo=None):
    filename = os.path.basename(filename)
    dest = os.path.join(UPLOAD_FOLDER, filename)
    with open(dest, 'wb') as f:
        shutil.copyfileobj(request.stream, f)
    if not filename.endswith('.changes'):
        return '', 200
    package = filename.rsplit('.', 1)[0]
    with open(dest, 'r') as f:
        content = f.read()
    cmd = ['aptly-include', dest]
    if repo:
        cmd += [repo]
    try:
        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        return e.output, 422
    else:
        add_feed_entry(package, content)
        return output, 201


@app.route('/upload/<filename>', methods=['PUT'])
def upload(filename):
    return upload_file(request, filename)


@app.route('/upload/<repo>/<filename>', methods=['PUT'])
def upload_repo(repo, filename):
    return upload_file(request, filename, repo)


if __name__ == '__main__':
    app.run(debug=True)
