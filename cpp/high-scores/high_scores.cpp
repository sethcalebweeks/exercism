#include "high_scores.h"

#include <algorithm>
#include <cmath>

using namespace std;


namespace arcade {

    std::vector<int> HighScores::list_scores() {
        return scores;
    }

    int HighScores::latest_score() {
        return scores[scores.size() - 1];
    }

    int HighScores::personal_best() {
        int max = 0;
        for(int score : scores)
        {
            if (score > max)
            {
                max = score;
            }
            
        }

        return max;
    }

    std::vector<int> HighScores::top_three() {
        int size = scores.size();
        std::vector<int> sorted = scores;
        sort(sorted.begin(), sorted.end(), greater<int>());
        return std::vector<int>(sorted.begin(), sorted.begin() + min(3, size));
    }

}  // namespace arcade
