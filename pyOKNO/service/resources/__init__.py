#!/usr/bin/env python
from flask import jsonify, g
from common.app import FlaskApp

__app__ = FlaskApp().app


@__app__.errorhandler(404)
def page_not_found(error):
    return jsonify({
        'error': 'Page Not Found'
    }), 404


@__app__.teardown_request
def teardown_request(exception=None):
    if hasattr(g, 'session'):
        if g.session is not None:
            g.session.close()
            delattr(g, 'session')
