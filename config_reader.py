# A utility to read in our programming language agnostic
# settings file
# Mark Redar, Brian Tingle; CDL Digital Special Collections
# BSD License
from __future__ import with_statement
import xml.etree.ElementTree as ET
import os

def read_config(config_file=None):
    '''Read the config file and return a dictionary filled in with values
    
    >>> db = read_config("./testdatabases.xml")
    >>> print db
    {'default': {'ENGINE': 'django.db.backends.mysql', 'NAME': 'name1', 'HOST': 'db.example.org', 'USER': 'user1', 'PASSWORD': 'pass1', 'PORT': '3333'}, 'default-ro': {'ENGINE': 'django.db.backends.mysql', 'NAME': 'name1ro', 'HOST': 'db.example.org', 'USER': 'user1ro', 'PASSWORD': 'pass1ro', 'PORT': '3333'}}
    '''
    if not config_file:
        HOME = os.environ['HOME']
        config_file = os.environ.get('DATABASES_XML_FILE', HOME + '/.databases.xml')
    with open(config_file, 'r') as f:
        etree = ET.parse(f)
    config_dict = {}
    #currently only databases section is in xml
    #so this returns the contained nodes in databases
    db_root = etree.getroot()
    if db_root.tag != 'databases':
        raise ValueError(''.join(('The XML format of the config file has changed. ', __file__, ' will need to be updated')))
    #we won't bother recursing as we know exactly what we need
    for db in db_root.getchildren():
        db_settings = {'ENGINE':'django.db.backends.mysql'}
        for elem in db.getchildren():
            db_settings[elem.tag.upper()] = elem.text
        config_dict[db.attrib['name']] = db_settings
    return config_dict

if __name__=='__main__':
    import doctest
    doctest.testmod()
