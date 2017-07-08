vp: requirements.txt
	virtualenv --no-site-packages vp
	vp/bin/pip install -U pip setuptools
	vp/bin/pip install -r requirements.txt
