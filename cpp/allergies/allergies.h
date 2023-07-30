#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <string>
#include <unordered_set>

using namespace std;

namespace allergies {
  class allergy_test {
    unsigned int _score;
    unsigned int allergen_score(const string allergen);
    public:
      allergy_test(unsigned int score);
      bool is_allergic_to(const string allergen);
      unordered_set<string> get_allergies();
  };
}  // namespace allergies

#endif // ALLERGIES_H