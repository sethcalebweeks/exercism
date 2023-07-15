#include <array>
#include <string>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
  std::vector<int> rounded_scores(student_scores.size());
  for (int student{0}; student < student_scores.size(); student++) {
    rounded_scores[student] = static_cast<int>(student_scores[student]);
  }
  return rounded_scores;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
  int failed_students{0};
  for (int student{0}; student < student_scores.size(); student++) {
    if (student_scores[student] <= 40) {
      failed_students++;
    }
  }
  return failed_students;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
  std::vector<int> best_students;
  for (int student{0}; student < student_scores.size(); student++) {
    if (student_scores[student] >= threshold) {
      best_students.emplace_back(student_scores[student]);
    }
  }
  return best_students;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
  int interval_size{(highest_score - 40) / 4};
  std::array<int, 4> grade_thresholds;
  for (int grade{0}; grade < grade_thresholds.size(); grade++) {
    grade_thresholds[grade] = 41 + (interval_size * grade);
  }
  return grade_thresholds;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
  std::vector<std::string> ranked_students;
  for (int student{1}; student <= student_scores.size(); student++) {
    ranked_students.emplace_back(std::to_string(student) + ". " + student_names[student - 1] + ": " + std::to_string(student_scores[student - 1]));
  }
  return ranked_students;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
  for (int student{0}; student < student_scores.size(); student++) {
    if (student_scores[student] == 100) {
      return student_names[student];
    }
  }
  return "";
}