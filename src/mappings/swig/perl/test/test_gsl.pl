use ascilib::gsl;

my $data =   [
        17, 18, 16, 18, 12,
        20, 18, 20, 20, 22,
        20, 10, 8, 12, 16,
        16, 18, 20, 18, 21
    ];

my $result1 = gsl::gsl_stats_kurtosis($data, 1, 20);
my $result2 = gsl::gsl_stats_mean([3,4,5,7],1,4);
print "returns $result1 and $result2!\n";

exit ($result2 != 4.75);
