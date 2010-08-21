# A utility to read in our programming language agnostic
# settings file
# Mark Redar, Brian Tingle; CDL Digital Special Collections
# BSD License
use XML::LibXML;
sub read_config {
    my $config_file = @_[0] || "$ENV{'HOME'}/.databases.xml";
    my %config_hash = (); 
    $dom = XML::LibXML->load_xml(location => $config_file);
    unless ( $dom->findvalue("/databases") ) {
        die "The XML format of the config file has changed. $config_file will need to be updated";
    }
    for $database ( $dom->findnodes("/databases/database") ) {
        my $database_name = $database->findvalue("\@name");
        for $field ($database->findnodes("*")) {
            my $element_name = $field->findvalue("name()");
            my $element_value = $field->findvalue(".");
            $config_hash{$database_name}{$element_name} = $element_value;
        }
    }
    return \%config_hash;
}
1;
