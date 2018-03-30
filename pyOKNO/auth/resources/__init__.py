#!/usr/bin/env python
from flask import jsonify

from common.app import FlaskApp
from auth.resources.token import EPToken


__app__ = FlaskApp.instance().app


@__app__.errorhandler(404)
def page_not_found(error):
    return jsonify({
        'error': 'Sorry. Page Not Found'
    }), 404
