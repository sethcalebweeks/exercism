#include "bob.h"
#include <string>
#include <cctype>

using namespace std;

namespace bob {
  bool isQuestion(string input) {
    return input.back() == '?';
  }

  bool isYelling(string input) {
    bool hasLetters = false;
    for (u_int i = 0; i < input.length(); i++) {
      if (isalpha(input[i])) {
        hasLetters = true;
        if (islower(input[i])) {
          return false;
        }
      }
    }
    return hasLetters;
  }

  string trim(string input) {
    string trimmedInput = input;
    while (isspace(trimmedInput.back())) {
      trimmedInput.pop_back();
    }
    return trimmedInput;
  }

  string hey(string input) {
    string trimmedInput = trim(input);
    if (trimmedInput.empty()) {
      return "Fine. Be that way!";
    } else if (isQuestion(trimmedInput) && isYelling(trimmedInput)) {
      return "Calm down, I know what I'm doing!";
    } else if (isQuestion(trimmedInput)) {
      return "Sure.";
    } else if (isYelling(trimmedInput)) {
      return "Whoa, chill out!";
    }
    return "Whatever.";
  }
}
