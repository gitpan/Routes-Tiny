use strict;
use warnings;

use Test::More tests => 5;

use Routes::Tiny;

my $r = Routes::Tiny->new;

$r->add_route(
    '/articles/:id',
    name        => 'article',
    constraints => {id => qr/\d+/}
);

my $m = $r->match('articles/abc');
ok(!$m);

$m = $r->match('articles/123');
is_deeply($m->params, {id => 123});
is($r->build_path('article', id => 123), '/articles/123');

eval { $r->build_path('article'); };
ok($@ =~ qr/Required param 'id' was not passed when building a path/);

eval { $r->build_path('article', id => 'abc'); };
ok($@ =~ qr/Param 'id' fails a constraint/);
