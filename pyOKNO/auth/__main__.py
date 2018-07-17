#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command from sup-directory:
    python -m auth
"""
from auth.resources.home import Home
from auth.resources.token import EPToken
from common.app import FlaskApp


def launch():
    FlaskApp.instance().debug_mode()
    FlaskApp.instance().app.logger.info('adding resource...')
    FlaskApp.instance().api.add_resource(EPToken, '/token')
    FlaskApp.instance().api.add_resource(Home, "/")
    FlaskApp.instance().start()


if __name__ == '__main__':
    launch()

