#!/usr/bin/env python
from flask import jsonify
from common.app import FlaskApp

__app__ = FlaskApp.instance().app


@__app__.errorhandler(404)
def page_not_found(error):
    return jsonify({
        'error': 'Page Not Found'
    }), 404
