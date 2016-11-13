#!/usr/bin/env python

import os
from flask import Flask
from flask_restful import Api
from blueprint import Blueprint
from common.app import CApp

CApp(__name__).debug_mode()

app = CApp().get_app()
api = CApp().get_api()

from auth.resources.token import EPToken

app.logger.info('adding resources...')
api.add_resource(EPToken, '/token')

