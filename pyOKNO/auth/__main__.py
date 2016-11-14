#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command from sup-directory:
    python -m auth
"""
from ..auth_micro import launch

if __name__ == '__main__':
    launch()
