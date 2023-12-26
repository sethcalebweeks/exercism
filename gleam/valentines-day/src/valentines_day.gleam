pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Horror
  Romance
  Thriller
  Crime
}

pub type Activity {
  BoardGame
  Movie(Genre)
  Restaurant(Cuisine)
  Chill
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(Romance) -> Yes
    Movie(_) -> No
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(distance) if distance > 11 -> Yes
    Walk(distance) if distance > 6 -> Maybe
    Walk(_) -> No
  }
}
