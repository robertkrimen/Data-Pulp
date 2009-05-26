use inc::Module::Install;

name     'Data-Pulp';
all_from 'lib/Data/Pulp.pm';
author   'Robert Krimen <rkrimen@cpan.org>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

