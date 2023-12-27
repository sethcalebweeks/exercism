import gleam/string
import gleam/list

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

fn advance(robot: Robot) -> Robot {
  let Robot(direction, position) = robot
  case direction {
    North -> Robot(direction, Position(position.x, position.y + 1))
    East -> Robot(direction, Position(position.x + 1, position.y))
    South -> Robot(direction, Position(position.x, position.y - 1))
    West -> Robot(direction, Position(position.x - 1, position.y))
  }
}

fn turn_left(robot: Robot) -> Robot {
  let Robot(direction, position) = robot
  case direction {
    North -> Robot(West, position)
    East -> Robot(North, position)
    South -> Robot(East, position)
    West -> Robot(South, position)
  }
}

fn turn_right(robot: Robot) -> Robot {
  let Robot(direction, position) = robot
  case direction {
    North -> Robot(East, position)
    East -> Robot(South, position)
    South -> Robot(West, position)
    West -> Robot(North, position)
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let instructions = string.split(instructions, "")
  list.fold(instructions, Robot(direction, position), fn(robot, instruction) {
    case instruction {
      "A" -> advance(robot)
      "L" -> turn_left(robot)
      "R" -> turn_right(robot)
    }
  })
}
