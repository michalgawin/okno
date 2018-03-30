#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command from sup-directory:
    python -m service
"""
import os

from common.app import FlaskApp
from common.database import CDatabase
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
    host = os.environ.get('SERVER_HOST', '0.0.0.0')
    try:
        port = int(os.environ.get('SERVER_PORT', PORT_))
    except ValueError:
       port = PORT_
    CDatabase.instance()
    FlaskApp.instance().debug_mode()
    FlaskApp.instance().app.logger.info('adding resources...')
    FlaskApp.instance().api.add_resource(EPWelcome, '/')
    FlaskApp.instance().api.add_resource(EPToken, '/token')
    FlaskApp.instance().api.add_resource(EPSubjects, '/subject')
    FlaskApp.instance().api.add_resource(EPSubject, '/subject/<int:id>')
    FlaskApp.instance().api.add_resource(EPAnnounce, '/announce')
    FlaskApp.instance().api.add_resource(EPAnnounceGeneral, '/announce/general/<int:offset>/<int:limit>')
    FlaskApp.instance().api.add_resource(EPAnnounceDep, '/announce/const/<int:id>/<int:offset>/<int:limit>')
    FlaskApp.instance().api.add_resource(EPDepartment, '/department')
    FlaskApp.instance().api.add_resource(EPCalendar, '/calendar/<int:year>/<int:month>/<int:day>')
    FlaskApp.instance().app.run(host, port, debug=True)

if __name__ == '__main__':
    launch()
