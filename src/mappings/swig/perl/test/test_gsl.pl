use ascilib::gsl;

my $result = gsl::gsl_stats_mean([3,4,5,7],1,4);
print "returns $result!\n";

exit ($result != 4.75);
