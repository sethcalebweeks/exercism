#include "allergies.h"

#include <string>
#include <iostream>
#include <unordered_set>

using namespace std;

namespace allergies {

  unsigned int allergy_test::allergen_score(const string allergen) {

    if (allergen == "eggs") {
      return 1;
    } else if (allergen == "peanuts") {
      return 2;
    } else if (allergen == "shellfish") {
      return 4;
    } else if (allergen == "strawberries") {
      return 8;
    } else if (allergen == "tomatoes") {
      return 16;
    } else if (allergen == "chocolate") {
      return 32;
    } else if (allergen == "pollen") {
      return 64;
    } else if (allergen == "cats") {
      return 128;
    } else {
      return 0;
    }
  }

  allergy_test::allergy_test(unsigned int score) {
    _score = score;
  }

  bool allergy_test::is_allergic_to(const string allergen) {
    return (_score & allergen_score(allergen)) >= 1;
  }

  unordered_set<string> allergy_test::get_allergies() {
    unordered_set<string> allergies;
    unordered_set<string> allergens{
      "eggs",
      "peanuts",
      "shellfish",
      "strawberries",
      "tomatoes",
      "chocolate",
      "pollen",
      "cats"
    };
    for (string allergen : allergens)
    {
      if (is_allergic_to(allergen))
      {
        allergies.insert(allergen);
      }
    }
    
    return allergies;
  }

}  // namespace allergies
