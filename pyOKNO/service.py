#!/usr/bin/env python

"""
This script runs the application using a development server.
To run it type following command
    python app.py
"""
import os
from service import app

PORT_ = 7777

def launch():
    HOST = os.environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(os.environ.get('SERVER_PORT', PORT_))
    except ValueError:
       PORT = PORT_ 
    app.run("0.0.0.0", PORT, debug=True)


if __name__ == '__main__':
    launch()
