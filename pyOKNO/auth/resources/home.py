#!/usr/bin/env python
from flask import url_for
from flask_restful import Resource

from common.app import FlaskApp


class Home(Resource):
    def post(self):
        FlaskApp.instance().app.logger.info('got token request|post')
        return {
                   'message': 'Hello',
                   'uri': url_for('home'.lower())
               }, 200
    
    def get(self):
        FlaskApp.instance().app.logger.info('got token request|get')
        return {
                   'Name': "You"
               }, 200
