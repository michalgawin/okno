#!/usr/bin/env python
from flask import url_for, g
from datetime import datetime, date, timedelta
from common.base import EPBase
from service.resources.authentication import auth
from common.db import TYear, TCalendar
from flask import request

class EPCalendar(EPBase):
    @auth.login_required
    def get(self, year=None, month=None, day=None):
        try:
            from_ = date(year, month, day)
        except TypeError:
            from_ = datetime.now().date()
        finally:
            to_ = from_ + timedelta(days=int(request.args.get('days')))
        calendar = []
        try:
            for cal, y in self.session.query(TCalendar, TYear).\
                order_by(TCalendar.data_od.asc()).\
                filter((TCalendar.data_od <= to_) &
                       (TCalendar.data_do >= from_)).\
                filter(TCalendar.rok_akademicki_id == TYear.rok_akademicki_id).\
                all():
                calendar.append(
                    {'nazwa': cal.nazwa,
                     'start': cal.data_od.isoformat(),
                     'koniec': cal.data_do.isoformat()})
        finally:
            self.session.close()
        return super(EPCalendar, self).get(
            {'calendar': calendar,
             'uri': url_for('EPAnnounce'.lower())})
