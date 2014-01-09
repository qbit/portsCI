package PortsCIDB;

use strict;
use warnings;
use Data::Dumper;

sub new {
	my ($class, $options) = @_;
	my $self = {};

	foreach my $opt (%$options) {
		$self->{$opt} = $options->{$opt};
	}

	bless $self, $class;

	if ($self->{db}) {
		$self->_read();
	}

	$self->{store} = [];

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

	my $ret = pop $self->{store};

	$self->debug("PortsCIDB->dpop: $ret");
	$self->_write();

	return $ret;
}

sub dpush {
	# push a record into the queue
	my ($self, $line) = @_;

	$self->debug("PortsCIDB->dpush: $line");

	push($self->{store}, time .";". $line);

	$self->_write();
}

sub dshift {
	# return the first value in the queue
	my $self = shift;

	my $ret = shift $self->{store};
	
	$self->debug("PortsCIDB->dshift: $ret");
	$self->_write();

	return $ret;
}

sub finish {
	my $self = shift;
	$self->debug("PortsCIDB->finish");
	$self->_write();
}

sub _write {
	my ($self, $db) = @_;

	if ($db) {
		open(FH, ">", $db) or die "Can't open $db";
	} else {
		open(FH, ">", $self->{db}) or die "Can't open $self->{db}";
	}

	foreach (@{$self->{store}}) {
		my $time = time;
		print FH "$time;$_\n";
	}

	close FH;
}

sub _read {
	my ($self, $db) = @_;

	if ($db) {
		open(FH, "<", $db) or die "Can't open $db";
	} else {
		open(FH, "<", $self->{db}) or die "Can't open $self->{db}";
	}

	$self->{store} = <FH>;

	
	close FH;
}

sub _query {
	# query the queue for various fields
	my ($self, $param) = @_;
	$self->debug("PortsCIDB->_query");
}

1
