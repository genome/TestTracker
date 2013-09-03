package TestTracker::InteractiveCoverageExecutor;
use TestTracker::InteractiveExecutor;

use strict;
use warnings;

sub main {
    my ($exec, $test_name) = @_;
    my $db_name = test_name_to_cover_db_name($test_name);
    my $options = "-MDevel::Cover=-db,$db_name";
    my $old_perl5opt = $ENV{PERL5OPT};
    $ENV{PERL5OPT} = $options;
    my $rv = TestTracker::InteractiveExecutor::main($exec, $test_name);
    $ENV{PERL5OPT} = $old_perl5opt;
    return $rv;
}

sub test_name_to_cover_db_name {
    my $test_name= shift;
    my $db_name = $test_name;
    $db_name =~ s/\//_/g;
    $db_name =~ s/\./_/g;
    my $output_dir = $ENV{TT_COVER_OUTPUT_DIR};
    if ($output_dir) {
        $db_name = "$output_dir/$db_name";
    }
    return $db_name;
}

1;

