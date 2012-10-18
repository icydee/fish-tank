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

done_testing;
exit;

