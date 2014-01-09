#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use lib 'lib';

use PortsCIDB;

my $opts = {
	debug => 1,
	db => 'tests/test.db'
};

my $db = new PortsCIDB($opts);

$db->dpush('lang/node');
$db->dpush('lang/libv8');

$db->finish();

# verify db here
