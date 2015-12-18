# This file is part of censusgeocode.
# https://github.com/fitnr/censusgeocode

# Licensed under the General Public License (version 3)
# http://opensource.org/licenses/LGPL-3.0
# Copyright (c) 2015, Neil Freeman <contact@fakeisthenewreal.org>

.PHONY: install upload
install: README.rst
	python setup.py install

README.rst: README.md
	- pandoc $< -o $@
	@touch $@
	python setup.py check --restructuredtext --strict

deploy: README.rst
	rm -rf dist build
	python setup.py register
	python setup.py bdist_wheel
	rm -rf dist build
	python3 setup.py bdist_wheel
	twine upload dist/*
