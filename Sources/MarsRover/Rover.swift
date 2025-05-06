struct RoverState {
    var xCoordinate: Int = 0
    var yCoordinate: Int = 0
    var direction: Direction
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
           let dirChar = segments[2].first,
           let dir = Direction(rawValue: dirChar) {
            roverState = RoverState(xCoordinate: xCoordinate, yCoordinate: yCoordinate, direction: dir)
        } else {
            roverState = RoverState(xCoordinate: 0, yCoordinate: 0, direction: .north)
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
                roverState.direction = roverState.direction.turnedLeft()
            case .right:
                roverState.direction = roverState.direction.turnedRight()
            case .move:
                switch roverState.direction {
                case .north: roverState.yCoordinate += 1
                case .south: roverState.yCoordinate -= 1
                case .east:  roverState.xCoordinate += 1
                case .west:  roverState.xCoordinate -= 1
                }
            }
        }
    }

    func endPosition() -> String {
        return "\(roverState.xCoordinate) \(roverState.yCoordinate) \(roverState.direction.rawValue)"
    }
}
