import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

fn next_player(player: Player) -> Player {
  case player {
    Black -> White
    White -> Black
  }
}

fn complete_turn(game_result: Result(Game, String), original: Game) -> Game {
  case game_result {
    Ok(game) -> Game(..game, player: next_player(game.player))
    Error(error) -> Game(..original, error: error)
  }
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  game
  |> rule1
  |> result.map(rule2)
  |> result.try(rule3)
  |> result.try(rule4)
  |> complete_turn(game)
}
