#!/usr/bin/env python

# Modified from https://www.huyng.com/posts/modifying-python-simplehttpserver
# Useful for serving static sites while developing for GitHub Pages projects.
# Since repo sites aren't hosted at '/', but at '/repo-name', adding directory
# aliases is a more friendly way to develop.

# Accepts a command line args for the directory alias and the port number

import sys
import os
import posixpath
import urllib
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler


class RequestHandler(SimpleHTTPRequestHandler):
  def translate_path(self, path):
    """translate path given routes"""

    # look up routes and set root directory accordingly
    for pattern, rootdir in ROUTES:
      if path.startswith(pattern):
        # found match!
        path = path[len(pattern):]  # consume path up to pattern len
        ROOT = rootdir
        break

    # normalize path and prepend root directory
    path = path.split('?',1)[0]
    path = path.split('#',1)[0]
    path = posixpath.normpath(urllib.unquote(path))
    words = path.split('/')
    words = filter(None, words)

    path = ROOT 
    for word in words:
      drive, word = os.path.splitdrive(word)
      head, word = os.path.split(word)
      if word in (os.curdir, os.pardir):
        continue
      path = os.path.join(path, word)

    return path


if __name__ == '__main__':
  if len(sys.argv) != 3:
    print "usage:\n\tpython server.py <port-num> <directory-alias-path>"
    sys.exit()

  # set default root to cwd
  ROOT = os.getcwd()
  ALIAS = sys.argv[2]
  if ALIAS[0] != '/':
    ALIAS = '/' + ALIAS

  # modify this to add additional routes
  ROUTES = (
    # [url_prefix ,  directory_path]
    [ALIAS, ROOT],
    ['/',   ROOT]
  ) 

  BaseHTTPServer.test(RequestHandler, BaseHTTPServer.HTTPServer)
