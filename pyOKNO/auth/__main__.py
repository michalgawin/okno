#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command from sup-directory:
    python -m auth
"""
import os

from auth.resources.home import Home
from auth.resources.token import EPToken
from common.app import FlaskApp


PORT_ = 6666


def launch():
    FlaskApp().app.logger.info('adding resource...')
    FlaskApp().api.add_resource(EPToken, '/token')
    FlaskApp().api.add_resource(Home, "/")
    FlaskApp().debug_mode()
    try:
        port = int(os.environ.get('SERVER_PORT', PORT_))
    except ValueError:
        port = PORT_
    FlaskApp().start(port)


if __name__ == '__main__':
    launch()

