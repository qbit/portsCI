package PortsCIDB;

use strict;
use warnings;

sub new {
	my ($class, $options) = @_;
	my $self = {};

	foreach my $opt (%$options) {
		$self->{$opt} = $options->{$opt};
	}

	bless $self, $class;

	return $self;
}

sub debug {
	my ($self, $msg) = @_;
	my $date = localtime;
	print "$date - $msg\n" if $self->{debug};
}

sub dpop {
	# pop the last record off the queue
	my $self = shift;
	$self->debug("PortsCIDB->dpop");
}

sub dpush {
	# push a record into the queue
	my ($self, $line) = @_;
	$self->debug("PortsCIDB->dpush");
}

sub dshift {
	# return the first value in the queue
	my $self = shift;
	$self->debug("PortsCIDB->dshift");
}

sub _query {
	# query the queue for various fields
	my ($self, $param) = @_;
	$self->debug("PortsCIDB->_query");
}

1
