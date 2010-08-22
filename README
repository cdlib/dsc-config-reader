-*- restructuredtext -*-

config_reader 
=============

In an attempt to keep database passwords out of revision control,
a multi-lingual library to read database connection information
from a common file.

Problem
-------
There are database passwords hardcoded in various places in the
codebase and so we can't keep our code in a public repository.

Languages
---------
python, perl, XSLT; maybe bash or java in the future

Solution
--------
config_reader

Design Considerations
---------------------

XML since it needs to work from XSLT / saxon that connects to mysql via
extension function.

The format of the XML matches very closely the structure of the python
dictionary django's setting.py requires in django > 1.2.

Using config_reader
-------------------
see the source files / test files for examples of use
