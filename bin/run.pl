#!/usr/bin/perl

use strict;
use warnings;
use Switch;

print_help();

while(1) {
    print "> ";
    chomp(my $command_input = <STDIN>);

    my ($command, @bits) = split(/\s/, $command_input);

    switch($command) {
        case 'help'         { print_help() }
        case 'exit'         { die "Goodbye\n" }
        case 'add'          { add(@bits) }
        case 'temperature'  { set_temperature(@bits) }
        case 'depth'        { set_depth(@bits) }
        case 'tick'         { tick(@bits) }
        else { print_error(); }
    }
}

sub add {
    my ($thing, $quantity) = @_;

    switch($thing) {
        case 'food'         { print "add $quantity of food\n" }
        case 'Clockwork'    { print "add $quantity Clockwork Fish\n" }
        case 'Pirahna'      { print "add $quantity Pirahna\n" }
        case 'Sun'          { print "add $quantity Sun Fish\n" }
        case 'Diver'        { print "add $quantity Diver Fish\n" }
        case 'Snail'        { print "add $quantity Snail\n" }
        else { print_error(); }
    }
}

sub set_temperature {
    my ($degrees) = @_;

    print "Temperature set to $degrees Centigrade\n";
}

sub set_depth {
    my ($depth) = @_;

    print "Depth of water changed to $depth centimeters\n";
}

sub tick {
    my ($time) = @_;

    print "Tick the clock by $time seconds\n";
}

sub print_error {
    print "Invalid command\n";
}

sub print_help {
    print <<EOTEXT;
The available commands are:
    help (prints this message)
    exit (exits the program)
    add <thing> <quantity> (Add a number of items)
      <thing> can be one of
        food (add fish food)
        Pirahna (add <quantity> of Pirahna Fish)
        Sun (add <quantity> of Sun Fish)
        Diver (add <quantity> of Diver Fish)
        Snail (add <quantity> of Snails)
    temperature <degrees> (Set the temperature in degrees C.)
    depth <cm> (Set the depth of water in centimeters)
    tick <seconds> (Advance the simulation time, in seconds)
EOTEXT
    return;
}
1;
