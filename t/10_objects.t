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
});

isa_ok($tank, 'MoonFruit::Simulator::Tank');
is($tank->depth, 100, "Set the correct depth");
is($tank->temperature, 20, "Set the correct temperature");
is(scalar @{$tank->creatures}, 0, "Start with no creatures");

foreach my $creature_class ('Snail','Fish::Diver','Fish::Pirahna','Fish::Sun','Fish::Clockwork') {
    my $class = "MoonFruit::Simulator::Creature::$creature_class";
    my $creature = $class->new;
    isa_ok($creature, 'MoonFruit::Simulator::Creature');
    isa_ok($creature, $class);

    # add this creature to the tank
    $tank->add_creature($creature);
}

is(scalar @{$tank->creatures}, 5, "We have added five creatures");


$tank = MoonFruit::Simulator::Tank->new({
    depth       => 100,
    temperature => 20,
    food        => 1000,
    oxygen      => 1000,
});

# Test to ensure Clockwork fish don't consume food or oxygen

my $fish = MoonFruit::Simulator::Creature::Fish::Clockwork->new;

$tank->add_creature($fish);

$tank->tick(100);

is($tank->depth, 100, "Clockwork fish don't consume water");
is($tank->temperature, 20, "Clockwork fish don't change the water temperature");
is($tank->food, 1000, "Clockwork fish don't consume food");
is($tank->oxygen, 1000, "Clockwork fish don't breath");

done_testing;
exit;

