#!/usr/bin/env python
from flask import jsonify
from flask_restful import Resource
from sqlalchemy.orm import Session
from okno_service.common.db import CDatabase

class EPBase(Resource):
    def __init__(self):
        super(EPBase, self).__init__()
        self.session = CDatabase.get_session()

    def get(self, response):
        return jsonify(response)
    
    def post(self, response):
        return jsonify(response)
    
    def put(self, response):
        return jsonify(response)
