#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use lib 'lib';

use PortsCIDB;

my $opts = {
	debug => 1 #,
	#dbfile => 'test.db'
};

my $db = new PortsCIDB($opts);

$db->dpop();
