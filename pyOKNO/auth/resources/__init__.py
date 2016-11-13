#!/usr/bin/env python
from flask import jsonify
from .. import app

@app.errorhandler(404)
def page_not_found(error):
    return jsonify({'error': 'Page Not Found'}), 404
