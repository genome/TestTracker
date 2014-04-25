use strict;
use warnings;

use Test::More;
use File::Basename qw(basename);

use_ok("TestTracker::InteractiveCoverageExecutor");
my ($method) = basename(__FILE__) =~ /(.*)\.t$/;
ok(TestTracker::InteractiveCoverageExecutor->can($method), qq(InteractiveCoverageExecutor can $method));

my @in = (
    ["Foo/Bar.t", "Foo_Bar_t"],
    ["Foo.t", "Foo_t"],
);

for my $in (@in) {
    my ($test_name, $expected_name) = @$in;
    my $db_name = TestTracker::InteractiveCoverageExecutor::test_name_to_cover_db_name($test_name);
    is ($db_name, $expected_name, qq(got correct output for test $test_name));
}
done_testing();
