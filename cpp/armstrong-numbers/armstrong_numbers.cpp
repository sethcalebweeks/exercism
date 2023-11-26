#include "armstrong_numbers.h"
#include <cmath>
using namespace std;

namespace armstrong_numbers {
    bool is_armstrong_number(int number) {
        int digits = 0, result = 0;
        int original = number;

        while (number != 0) {
            number /= 10;
            ++digits;
        }
    
        number = original;

        while (number != 0) {
            int remainder = number % 10;
            result += pow(remainder, digits);
            number /= 10;
        }
        
        return result == original;
    }

}  // namespace armstrong_numbers
