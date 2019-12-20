config = b"/etc/mercurial/hgweb.config"
import os
os.environ["HGENCODING"] = "UTF-8"
import hgdemandimport; hgdemandimport.enable()
from mercurial.hgweb import hgweb
application = hgweb(config)
