#!/bin/env bash
set -e
set -u
# python __main__ for the module is a test
python config_reader.py 
perl test.pl 
xsltproc test.xslt test.xslt
