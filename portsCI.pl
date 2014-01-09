#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use lib 'lib';

use PortsCIDB;

my $opts = {
	debug => 1,
	db => 'test.db'
};

my $db = new PortsCIDB($opts);

#$db->dpush('lang/node');
#$db->dpush('lang/libv8');

warn Dumper $db->{store};

# while (1) {
	# my $port = $db->dshift();
	# if ($port) {
	# 	print "Building: $port\n";
	# } else {
	# 	print "waiting for more stuff\n";
	# 	sleep 10;
	# 	$db->dpush('productivity/taskwarrior');
	# }
# }

$db->finish();
