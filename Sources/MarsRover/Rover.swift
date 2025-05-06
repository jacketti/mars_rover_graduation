struct RoverState {
    var position: Position
    var direction: Direction
}

extension RoverState {
    mutating func turnLeft() {
        direction = direction.turnedLeft()
    }

    mutating func turnRight() {
        direction = direction.turnedRight()
    }

    mutating func moveForward() {
        position = position.moved(in: direction)
    }
}

enum Direction: Character {
    case north = "N"
    case east = "E"
    case south = "S"
    case west = "W"

    func turnedLeft() -> Direction {
        switch self {
        case .north: return .west
        case .west: return .south
        case .south: return .east
        case .east: return .north
        }
    }

    func turnedRight() -> Direction {
        switch self {
        case .north: return .east
        case .east: return .south
        case .south: return .west
        case .west: return .north
        }
    }
}

class Rover {
    private var roverState: RoverState

    init(_ position: String = "") {
        let segments = position.split(separator: " ")
        if segments.count == 3,
           let xCoordinate = Int(segments[0]),
           let yCoordinate = Int(segments[1]),
           let directionChar = segments[2].first,
           let direction = Direction(rawValue: directionChar) {
            let position = Position(xCoordinate: xCoordinate, yCoordinate: yCoordinate)
            roverState = RoverState(position: position, direction: direction)
        } else {
            roverState = RoverState(position: Position(xCoordinate: 0, yCoordinate: 0), direction: .north)
        }
    }

    enum Command: Character {
        case left = "L"
        case right = "R"
        case move = "M"
    }

    func followInstructions(_ commandString: String) {
        for char in commandString {
            guard let command = Command(rawValue: char) else { continue }

            switch command {
            case .left:
                roverState.turnLeft()
            case .right:
                roverState.turnRight()
            case .move:
                roverState.moveForward()
            }
        }
    }

    func endPosition() -> String {
        let position = roverState.position
        return "\(position.xCoordinate) \(position.yCoordinate) \(roverState.direction.rawValue)"
    }
}

struct Position {
    var xCoordinate: Int
    var yCoordinate: Int

    func moved(in direction: Direction) -> Position {
        switch direction {
        case .north: return Position(xCoordinate: xCoordinate, yCoordinate: yCoordinate + 1)
        case .south: return Position(xCoordinate: xCoordinate, yCoordinate: yCoordinate - 1)
        case .east: return Position(xCoordinate: xCoordinate + 1, yCoordinate: yCoordinate)
        case .west: return Position(xCoordinate: xCoordinate - 1, yCoordinate: yCoordinate)
        }
    }
}
