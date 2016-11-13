#!/usr/bin/env python

import os
from flask import Flask
from flask_restful import Api
from blueprint import Blueprint
from common.app import CApp

CApp(__name__).debug_mode()

app = CApp().get_app()
api = CApp().get_api()

from service.resources.welcome import EPWelcome
from service.resources.token import EPToken
from service.resources.subject import EPSubjects, EPSubject
from service.resources.announce import EPAnnounce
from service.resources.announce_general import EPAnnounceGeneral
from service.resources.announce_const import EPAnnounceConst
from service.resources.department import EPDepartment
from service.resources.calendar import EPCalendar

app.logger.info('adding resources...')
api.add_resource(EPWelcome, '/')
api.add_resource(EPToken, '/token')
api.add_resource(EPSubjects, '/subject')
api.add_resource(EPSubject, '/subject/<int:id>')
api.add_resource(EPAnnounce, '/announce')
api.add_resource(EPAnnounceGeneral, '/announce/general/<int:offset>/<int:limit>')
api.add_resource(EPAnnounceConst, '/announce/const/<int:id>/<int:offset>/<int:limit>')
api.add_resource(EPDepartment, '/department')
api.add_resource(EPCalendar, '/calendar/<int:year>/<int:month>/<int:day>')
