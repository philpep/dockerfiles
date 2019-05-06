config = "/etc/mercurial/hgweb.config"
import os
os.environ["HGENCODING"] = "UTF-8"
from mercurial import demandimport; demandimport.enable()
from mercurial.hgweb import hgweb
application = hgweb(config)
