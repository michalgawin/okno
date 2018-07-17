#!/usr/bin/env python
from sqlalchemy.ext.declarative import DeferredReflection, declarative_base

Base = declarative_base()


class AbstractBase(DeferredReflection, Base):

    __abstract__ = True

