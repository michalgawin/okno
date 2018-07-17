#!/usr/bin/env python
from flask import url_for
from common.base import EPBase
from common.db.model.TDepartment import TDepartment
from service.resources.authentication import __auth__


class EPDepartment(EPBase):
    @__auth__.login_required
    def get(self):
        department = []
        try:
            for dep in self.session.query(TDepartment).\
                    order_by(TDepartment.nazwa.asc()).\
                    all():
                department.append({
                    'id': dep.wydzial_id,
                    'name': dep.nazwa
                })
        finally:
            self.session.close()
        if len(department):
            uri = url_for('EPAnnounceDep'.lower(), id=department[0]['id'], limit=10, offset=0)
        else:
            uri = url_for('EPAnnounceDep'.lower(), id=0, limit=10, offset=0)
        return super(EPDepartment, self).get({
            'department': department,
            'uri': uri
        })
