#!/usr/bin/env python
from flask import url_for
from common.base import EPBase
from common.db.database import SessionDecorator
from common.db.model.TDepartment import TDepartment
from service.resources.authentication import __auth__


class EPDepartment(EPBase):

    @__auth__.login_required
    def get(self):
        return self._get()

    @SessionDecorator
    def _get(self):
        department = []
        for dep in g.session.query(TDepartment).\
                order_by(TDepartment.nazwa.asc()).\
                all():
            department.append({
                'id': dep.wydzial_id,
                'name': dep.nazwa
            })
        if len(department):
            uri = url_for('EPAnnounceDep'.lower(), id=department[0]['id'], limit=10, offset=0)
        else:
            uri = url_for('EPAnnounceDep'.lower(), id=0, limit=10, offset=0)
        return super(EPDepartment, self).get({
            'department': department,
            'uri': uri
        })
