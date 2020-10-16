import os
from mercurial.hgweb import hgweb
config = b"/etc/mercurial/hgweb.config"
os.environ["HGENCODING"] = "UTF-8"
# demandimort is currently broken with python3:
# https://bz.mercurial-scm.org/show_bug.cgi?id=6268
# import hgdemandimport; hgdemandimport.enable()
application = hgweb(config)
