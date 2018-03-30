#!/usr/bin/env python
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
    HOST = os.environ.get('SERVER_HOST', '0.0.0.0')
    try:
        PORT = int(os.environ.get('SERVER_PORT', PORT_))
    except ValueError:
       PORT = PORT_
    FlaskApp(__name__).debug_mode()
    FlaskApp().app().logger.info('adding resources...')
    FlaskApp().api().add_resource(EPWelcome, '/')
    FlaskApp().api().add_resource(EPToken, '/token')
    FlaskApp().api().add_resource(EPSubjects, '/subject')
    FlaskApp().api().add_resource(EPSubject, '/subject/<int:id>')
    FlaskApp().api().add_resource(EPAnnounce, '/announce')
    FlaskApp().api().add_resource(EPAnnounceGeneral, '/announce/general/<int:offset>/<int:limit>')
    FlaskApp().api().add_resource(EPAnnounceDep, '/announce/const/<int:id>/<int:offset>/<int:limit>')
    FlaskApp().api().add_resource(EPDepartment, '/department')
    FlaskApp().api().add_resource(EPCalendar, '/calendar/<int:year>/<int:month>/<int:day>')
    FlaskApp().app().run(HOST, PORT, debug=True)
