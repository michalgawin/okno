#!/usr/bin/env python

import os
from flask import Flask
from flask_restful import Api
from blueprint import Blueprint

class Singleton(type):
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]

class CApp(object):
    __metaclass__ = Singleton

    def __init__(self, *args):
        if (len(args)):
            name = args[0]
        else:
            name = __name__
        self.app = Flask(name)
        self.api = Api(self.app)
        self.appbp = Blueprint('api', name)
        self.wsgi_app = self.app.wsgi_app
        self.app.config['SECRET_KEY'] = "I\x8e\x96\xd1\x15r\xb4\xbf\xb6\x12\x17*\xed\x93!b/\xc3Yg\x93\xebG#" #os.urandom(24)
        self.app.logger.info('constuctor completed')

    def debug_mode(self):
        self.app.config['DEBUG'] = True
        self.app.config['TESTING'] = True
        return self
    
    def get_app(self):
        return self.app
    
    def get_api(self):
        return self.api

