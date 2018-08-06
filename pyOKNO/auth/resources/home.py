#!/usr/bin/env python
from flask import url_for
from flask_restful import Resource


class Home(Resource):
    def post(self):
        return {
                   'message': 'Hello',
                   'uri': url_for('home'.lower())
               }, 200
    
    def get(self):
        return {
                   'Name': "You"
               }, 200
