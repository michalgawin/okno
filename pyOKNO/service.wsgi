#!/usr/bin/env python
import sys

sys.path.insert(0, '/var/www/okno')
sys.path.insert(1, '/var/www/okno/service')

#activate_this = '/home/michal/OKNO/.ve/okno/bin/activate_this.py'
#execfile(activate_this, dict(__file__=activate_this))

from service import app as application

