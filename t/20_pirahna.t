#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use FindBin::libs;

BEGIN {
    use_ok('MoonFruit::Simulator::Tank');
    use_ok('MoonFruit::Simulator::Creature');
    use_ok('MoonFruit::Simulator::Creature::Snail');
    use_ok('MoonFruit::Simulator::Creature::Fish');
    use_ok('MoonFruit::Simulator::Creature::Fish::Diver');
    use_ok('MoonFruit::Simulator::Creature::Fish::Pirahna');
    use_ok('MoonFruit::Simulator::Creature::Fish::Sun');
    use_ok('MoonFruit::Simulator::Creature::Fish::Clockwork');
}

my $tank = MoonFruit::Simulator::Tank->new({
    depth       => 100,
    temperature => 20,
    food        => 1000,
    oxygen      => 1000,
});

# Test to ensure Pirahna fish consume food or oxygen

my $fish = MoonFruit::Simulator::Creature::Fish::Pirahna->new;

$tank->add_creature($fish);

# One hour
$tank->tick(3600);

TODO: {
    local $TODO = "Fish don't consume food yet";

    is($tank->food, 900, "Pirahna fish consume food in an hour");
}

is($tank->oxygen, 950, "Pirahna fish breath in an hour");
is($fish->status, 'alive', "Pirahna fish can live for an hour");

$tank->tick(3600);
is($tank->oxygen, 900, "Pirahna fish continue to breath after an hour");


$tank->oxygen(1000);
$tank->food(1000);

$tank->tick(1800);

TODO: {
    local $TODO = "Fish don't consume food yet";
    
    is($tank->food, 950, "Pirahna fish consume food in 30 minutes");
}

is($tank->oxygen, 975, "Pirahna fish breath in 30 minutes");

# Check if the pirahna can tolerate temperature changes

$tank->temperature(16);
$tank->tick;
is($fish->status, 'alive', "Warm enough for a Pirahna ".$fish->reason);

$tank->temperature(15);
$tank->tick;
is($fish->status, 'alive', "just warm enough for a Pirahna ".$fish->reason);

$tank->temperature(14);
$tank->tick;
is($fish->status, 'dead', "tropical Pihahna don't like the cold ".$fish->reason);


done_testing;
exit;

