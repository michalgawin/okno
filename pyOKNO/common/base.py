#!/usr/bin/env python
from flask import jsonify
from flask_restful import Resource


class EPBase(Resource):

    def __init__(self):
        super(EPBase, self).__init__()

    def get(self, response):
        return jsonify(response)
    
    def post(self, response):
        return jsonify(response)

    def put(self, response):
        return jsonify(response)
