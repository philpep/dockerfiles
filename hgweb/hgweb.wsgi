config = "/etc/mercurial/hgweb.config"
import os
os.environ["HGENCODING"] = "UTF-8"
import cgitb; cgitb.enable()
from mercurial import demandimport; demandimport.enable()
from mercurial.hgweb import hgweb
application = hgweb(config)
