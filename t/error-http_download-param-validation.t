use strict;
use Test::More;
use Test::Exception;
use File::Temp 'tempdir';
use IO::All;

use App::Perlbrew::HTTP qw(http_user_agent_program http_get http_download);

subtest "http_download: dies when when the download target already exists" => sub {
    my $dir = tempdir( CLEANUP => 1 );
    my $output = "$dir/whatever";

    io($output)->print("so");

    my $error;
    throws_ok {
        $error = http_download("https://install.perlbrew.pl", $output);
    } qr(^ERROR: The download target < \Q$output\E > already exists\.$);
};

done_testing;
