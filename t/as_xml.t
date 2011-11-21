#!/usr/bin/perl 

use warnings;
use strict;

# test the as_XML method 

use HTML::TreeBuilder;
use Test::More tests => 2;

{
my $tree= HTML::TreeBuilder->new;
my $html= qq{<html><head><script type="text/javascript"><![CDATA[ a> b && b < c]]></script></head><body><p>foo</p></body></html>\n};
$tree->parse( $html);
is( $tree->as_XML, $html, 'simple CDATA section in a script element');
}

{
my $tree= HTML::TreeBuilder->new;
my $html= qq{<html><head><script type="text/javascript">a &gt; b <![CDATA[ a> b && b < c]]> a &lt; b</script></head><body><p>foo</p></body></html>\n};
$tree->parse( $html);
is( $tree->as_XML, $html, 'CDATA mixed with non CDATA in the same  element');
}
