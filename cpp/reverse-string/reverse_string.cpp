#include "reverse_string.h"

namespace reverse_string {

  string reverse_string(const string input) {
    string output = "";
    for (int i = input.length() - 1; i >= 0; i--) {
      output += input[i];
    }
    return output;
  }

}  // namespace reverse_string
