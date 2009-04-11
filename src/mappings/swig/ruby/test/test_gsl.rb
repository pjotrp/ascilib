
require 'ascilib/gsl'

data =   [
        17, 18, 16, 18, 12,
        20, 18, 20, 20, 22,
        20, 10, 8, 12, 16,
        16, 18, 20, 18, 21
    ];

# result = Ascilib::gsl_stats_kurtosis(data, 1, 20);
# raise 'test failed' if result != 766
result = Ascilib::Gsl.gsl_stats_mean([3,4,5,7],1,4);
raise 'test failed' if result != 4.75

exit 0
