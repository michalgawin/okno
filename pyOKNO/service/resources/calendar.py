#!/usr/bin/env python
from flask import url_for
from datetime import datetime, date, timedelta
from common.base import EPBase
from common.db.database import SessionDecorator
from common.db.model.TCalendar import TCalendar
from common.db.model.TYear import TYear
from service.resources.authentication import __auth__
from flask import request


class EPCalendar(EPBase):

    @__auth__.login_required
    def get(self, year=None, month=None, day=None):
        return self.get(year, month, day)

    @SessionDecorator
    def _get(self, year, month, day):
        try:
            from_ = date(year, month, day)
        except TypeError:
            from_ = datetime.now().date()
        finally:
            to_ = from_ + timedelta(days=int(request.args.get('days')))
        calendar = []
        for cal, y in g.session.query(TCalendar, TYear).\
            order_by(TCalendar.data_od.asc()).\
                filter((TCalendar.data_od <= to_) & (TCalendar.data_do >= from_)).\
                filter(TCalendar.rok_akademicki_id == TYear.rok_akademicki_id).\
                all():
            calendar.append({
                'nazwa': cal.nazwa,
                'start': cal.data_od.isoformat(),
                'koniec': cal.data_do.isoformat()
            })
        return super(EPCalendar, self).get({
            'calendar': calendar,
            'uri': url_for('EPAnnounce'.lower())
        })
