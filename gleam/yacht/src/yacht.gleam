import gleam/list
import gleam/map
import gleam/int
import gleam/result

pub type Category {
  Ones
  Twos
  Threes
  Fours
  Fives
  Sixes
  FullHouse
  FourOfAKind
  LittleStraight
  BigStraight
  Choice
  Yacht
}

fn sum(dice: List(Int)) -> Int {
  list.fold(dice, 0, fn(sum, x) { sum + x })
}

fn face_value(value: Int, dice: List(Int)) -> Int {
  list.length(list.filter(dice, fn(d) { d == value })) * value
}

fn dice_counts(dice: List(Int)) -> List(Int) {
  dice
  |> list.group(fn(d) { d })
  |> map.values
  |> list.map(fn(x) { list.length(x) })
  |> list.sort(int.compare)
}

fn full_house(dice: List(Int)) -> Int {
  case dice_counts(dice) {
    [2, 3] -> sum(dice)
    _ -> 0
  }
}

fn four_of_a_kind(dice: List(Int)) -> Int {
  let dice_counts = dice
    |> list.group(fn(d) { d })
    |> map.values
    |> list.sort(fn(a, b) { int.compare(list.length(a), list.length(b)) })

  case dice_counts {
    [[_], four] -> result.unwrap(list.at(four, 0), 0) * 4
    [five] -> result.unwrap(list.at(five, 0), 0) * 4
    _ -> 0
  }
}

fn little_straight(dice: List(Int)) -> Int {
  case list.sort(dice, int.compare) {
    [1, 2, 3, 4, 5] -> 30
    _ -> 0
  }
}

fn big_straight(dice: List(Int)) -> Int {
  case list.sort(dice, int.compare) {
    [2, 3, 4, 5, 6] -> 30
    _ -> 0
  }
}

fn yacht(dice: List(Int)) -> Int {
  case dice_counts(dice) {
    [5] -> 50
    _ -> 0
  }
}

pub fn score(category: Category, dice: List(Int)) -> Int {
  case category {
    Ones -> face_value(1, dice)
    Twos -> face_value(2, dice)
    Threes -> face_value(3, dice)
    Fours -> face_value(4, dice)
    Fives -> face_value(5, dice)
    Sixes -> face_value(6, dice)
    FullHouse -> full_house(dice)
    FourOfAKind -> four_of_a_kind(dice)
    LittleStraight -> little_straight(dice)
    BigStraight -> big_straight(dice)
    Choice -> sum(dice)
    Yacht -> yacht(dice)
  }
}
