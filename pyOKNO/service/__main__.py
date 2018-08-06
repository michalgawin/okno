#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command from sup-directory:
    python -m service
"""
import os

from common.app import FlaskApp
from service.resources.welcome import EPWelcome
from service.resources.token import EPToken
from service.resources.subject import EPSubjects, EPSubject
from service.resources.announce import EPAnnounce
from service.resources.announce_general import EPAnnounceGeneral
from service.resources.announce_dep import EPAnnounceDep
from service.resources.department import EPDepartment
from service.resources.calendar import EPCalendar


PORT_ = 7777


def launch():
    FlaskApp().app.logger.info('adding resources...')
    FlaskApp().api.add_resource(EPWelcome, '/')
    FlaskApp().api.add_resource(EPToken, '/token')
    FlaskApp().api.add_resource(EPSubjects, '/subject')
    FlaskApp().api.add_resource(EPSubject, '/subject/<int:id>')
    FlaskApp().api.add_resource(EPAnnounce, '/announce')
    FlaskApp().api.add_resource(EPAnnounceGeneral, '/announce/general/<int:offset>/<int:limit>')
    FlaskApp().api.add_resource(EPAnnounceDep, '/announce/const/<int:id>/<int:offset>/<int:limit>')
    FlaskApp().api.add_resource(EPDepartment, '/department')
    FlaskApp().api.add_resource(EPCalendar, '/calendar/<int:year>/<int:month>/<int:day>')
    FlaskApp().debug_mode()
    try:
        port = int(os.environ.get('SERVER_PORT', PORT_))
    except ValueError:
        port = PORT_
    FlaskApp().start(port)


if __name__ == '__main__':
    launch()
