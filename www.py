import sys, datetime

from Grinder.web.webserver import Webserver

Webserver('0.0.0.0', sys.argv[1])