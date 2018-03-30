#!/usr/bin/env python
import os

from flask import Flask
from flask_restful import Api


class Singleton(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]


PORT_ = 6666


class FlaskApp(object):
    # __metaclass__ = Singleton

    def __init__(self, *args):
        # if len(args):
        #     name = args[0]
        # else:
        #     name = __name__
        # self.__dict__["app"] = Flask(name)
        # self.__dict__["api"] = Api(self.__dict__["app"])
        # self.appbp = Blueprint('api', name)
        # self.wsgi_app = self.app.wsgi_app
        self.app = None
        self.api = None
        self.app.config['SECRET_KEY'] = "I\x8e\x96\xd1\x15r\xb4\xbf\xb6\x12\x17*\xed\x93!b/\xc3Yg\x93\xebG#" #os.urandom(24)
        self.app.logger.info('constuctor completed')

    @classmethod
    def instance(cls):
        if not hasattr(cls, "_instance"):
            cls._instance = FlaskApp()
        return cls._instance

    def start(self):
        host_address = os.environ.get('SERVER_HOST', '0.0.0.0')
        try:
            host_port = int(os.environ.get('SERVER_PORT', PORT_))
        except ValueError:
            host_port = PORT_
        self.app.run(host_address, host_port, debug=True, use_reloader=False)

    def debug_mode(self):
        self.app.config['DEBUG'] = True
        self.app.config['TESTING'] = True
        return self

    @property
    def app(self):
        if self.__dict__["app"] is None:
            self.app = Flask(__name__)
        return self.__dict__["app"]

    @app.setter
    def app(self, val):
        self.__dict__["app"] = val

    @property
    def api(self):
        if self.__dict__["api"] is None:
            self.api = Api(self.app)
        return self.__dict__["api"]

    @api.setter
    def api(self, val):
        self.__dict__["api"] = val
