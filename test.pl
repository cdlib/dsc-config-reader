use config_reader;
use Data::Dumper;
my $get = read_config("./testdatabases.xml");
my $expect = {
          'default-ro' => {
                          'password' => 'pass1ro',
                          'user' => 'user1ro',
                          'name' => 'name1ro',
                          'port' => '3333',
                          'host' => 'db.example.org'
                        },
          'default' => {
                       'password' => 'pass1',
                       'user' => 'user1',
                       'name' => 'name1',
                       'port' => '3333',
                       'host' => 'db.example.org'
                     }
};
die "test failed" unless($get cmp $expect);
