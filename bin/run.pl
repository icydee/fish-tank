#!/usr/bin/perl

use strict;
use warnings;
use Switch;

use FindBin::libs;

use MoonFruit::Simulator::Tank;
use MoonFruit::Simulator::Creature::Snail;
use MoonFruit::Simulator::Creature::Fish::Pirahna;
use MoonFruit::Simulator::Creature::Fish::Sun;
use MoonFruit::Simulator::Creature::Fish::Clockwork;
use MoonFruit::Simulator::Creature::Fish::Diver;


our $tank = MoonFruit::Simulator::Tank->new;

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
        case 'stats'        { print $tank }
        else { print_error(); }
    }
}

sub add {
    my ($thing, $quantity) = @_;
    
    $thing = lc $thing;
    switch($thing) {
        case 'food'         { add_food($quantity) }
        case 'oxygen'       { add_oxygen($quantity) }
        case 'clockwork'    { add_creature('Fish::Clockwork', $quantity) }
        case 'pirahna'      { add_creature('Fish::Pirahna', $quantity) }
        case 'sun'          { add_creature('Fish::Sun', $quantity) }
        case 'diver'        { add_creature('Fish::Diver', $quantity) }
        case 'snail'        { add_creature('Snail', $quantity) }
        else { print_error(); }
    }
}

sub add_food {
    my ($quantity) = @_;

    $quantity = $quantity || 1;

    print "Added $quantity of fish food\n";
    $tank->food($tank->food + $quantity);
}

sub add_oxygen {
    my ($quantity) = @_;

    $quantity = $quantity || 1;

    print "added $quantity of oxygen\n";

    $tank->oxygen($tank->oxygen + $quantity);
}

sub add_creature {
    my ($thing, $quantity) = @_;
    $quantity = $quantity || 1;

    print "Added $quantity of $thing\n";
    for (1..$quantity) {
        my $class = "MoonFruit::Simulator::Creature::$thing";
        my $creature = $class->new;
        $tank->add_creature($creature);
    }
}

sub set_temperature {
    my ($degrees) = @_;

    $tank->temperature($degrees);
    print "Temperature set to $degrees Centigrade\n";
}

sub set_depth {
    my ($depth) = @_;
    $tank->depth($depth);

    print "Depth of water changed to $depth centimeters\n";
}

sub tick {
    my ($time) = @_;

    $time = $time || 1;

    print "Tick the clock by $time seconds\n";
    $tank->tick($time);
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
        food (add <quantity> of fish food)
        oxygen (add <quantity> of oxygen)
        Pirahna (add <quantity> of Pirahna Fish)
        Sun (add <quantity> of Sun Fish)
        Diver (add <quantity> of Diver Fish)
        Snail (add <quantity> of Snails)
    temperature <degrees> (Set the temperature in degrees C.)
    depth <cm> (Set the depth of water in centimeters)
    stats (print the current status of the tank and contents)
    tick <seconds> (Advance the simulation time, in seconds)
EOTEXT
    return;
}
1;
