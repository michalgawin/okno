# OKNO
Mobile platform for students

## Web-Service

### Installation

1. Run following commands from directory web_service:
  1. python -m pip install -r requirements
  2. python -m easy_install mysql-python
2. Download and install:
  1. Linux (CentOS7)
    1. yum install MySQL-python
3. Install nginx
  1. yum install ngnix
	
### Quick deployment
1. Import database schema
2. Create nginx server configuration:

server {
	listen 5555 default_server;
	listen [::]:5555 default_server;

	server_name okno.pw.edu.pl;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		proxy_pass http://localhost:7777;
	}

	location /token {
		proxy_pass http://localhost:6666;
	}

}

3. Run following command from root directory of project:
  1. python -m auth.py
  2. python -m service.py

#### Remarks
1. Problem to launch service:
  1. set PYTHONPATH=.;%PYTHONPATH%
