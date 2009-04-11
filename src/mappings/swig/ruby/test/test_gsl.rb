
require 'ascilib/gsl'

data =   [
        17, 18, 16, 18, 12,
        20, 18, 20, 20, 22,
        20, 10, 8, 12, 16,
        16, 18, 20, 18, 21
    ];

result = Ascilib::Gsl.gsl_stats_mean([3,4,5,7],1,4);
raise 'test failed' if result != 4.75

result = Ascilib::Gsl.gsl_stats_kurtosis(data, 1, 20);
result = (result*100).to_i
raise 'test failed' if result != -23

exit 0
