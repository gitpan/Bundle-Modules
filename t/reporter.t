#!/usr/bin/perl -w

use strict;
use Test;
use Bundle::Modules::Test::Reporter;

BEGIN { plan tests => 54 }

my $distro = sprintf "Test-Reporter-%s", $Bundle::Modules::Test::Reporter::VERSION;

my $reporter = Bundle::Modules::Test::Reporter->new();
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');

$reporter->grade('stable');
$reporter->distribution('Mail-Freshmeat-1.20');

ok($reporter->subject =~ /^STABLE Mail-Freshmeat-1.20\s/);
ok($reporter->report =~ /This distribution has been tested/);
ok($reporter->report =~ /Please cc any replies to/);
ok($reporter->report =~ /Summary of my/);
ok($reporter->grade, 'stable');
ok($reporter->distribution, 'Mail-Freshmeat-1.20');
ok($reporter->timeout, 120);

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new();
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');

$reporter->grade('unstable');
$reporter->distribution('Foo-Bar-1.50');
$reporter->comments('blah');
$reporter->timeout(60);
$reporter->via('Bundle::Modules');
$reporter->from('foo@bar.com');
$reporter->address('send@reports.here');
$reporter->mx([1, 2, 3, 4, 5, 6, 7, 8, 9]);

ok($reporter->subject =~ /^UNSTABLE Foo-Bar-1.50\s/);
ok($reporter->report =~ /This distribution has been tested/);
ok($reporter->report =~ /Please cc any replies to/);
ok($reporter->report =~ /Summary of my/);
ok($reporter->report =~ /blah/);
ok($reporter->grade, 'unstable');
ok($reporter->distribution, 'Foo-Bar-1.50');
ok($reporter->timeout, 60);
ok($reporter->comments, 'blah');
ok($reporter->via, 'Bundle::Modules');
ok($reporter->from, 'foo@bar.com');
ok($reporter->address, 'send@reports.here');
ok($reporter->debug, 0);
ok(scalar @{$reporter->mx}, 9);

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new();
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');

$reporter->grade('signature'); ## was na
ok($reporter->grade, 'signature'); ## was na
ok($reporter->timeout, 120);

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new();
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');

$reporter->grade('signature');
ok($reporter->grade, 'signature');

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new
(
	mx => [1, 2, 3, 4, 5],
	address => 'foo@bar',
	grade => 'stable',
	distribution => 'Bar-1.0',
	from => 'me@me.com',
	comments => 'woo',
	via => 'something',
	timeout => 500,
	debug => 0,
	dir => '/tmp',
);
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');
ok($reporter->subject =~ /^STABLE Bar-1.0\s/);
ok($reporter->report =~ /This distribution has been tested/);
ok($reporter->report =~ /Please cc any replies to/);
ok($reporter->report =~ /Summary of my/);
ok($reporter->report =~ /woo/);
ok($reporter->grade, 'stable');
ok($reporter->distribution, 'Bar-1.0');
ok($reporter->timeout, 500);
ok($reporter->comments, 'woo');
ok($reporter->via, 'something');
ok($reporter->from, 'me@me.com');
ok($reporter->address, 'foo@bar');
ok($reporter->debug, 0);
ok(scalar @{$reporter->mx}, 5);
ok($reporter->dir, '/tmp');

# ---

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new
(
    grade => 'stable',
    distribution => $distro,
);
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');
my $file = $reporter->write();
ok($file =~ /Test-Reporter/);
ok(-e $file);

undef $reporter;

$reporter = Bundle::Modules::Test::Reporter->new
(
)->read($file);
ok(ref $reporter, 'Bundle::Modules::Test::Reporter');
ok($reporter->subject =~ /^STABLE $distro\s/);
ok($reporter->report =~ /This distribution has been tested/);
ok($reporter->report =~ /Please cc any replies to/);
ok($reporter->report =~ /Summary of my/);
ok($reporter->grade, 'stable');
ok($reporter->distribution, $distro);
