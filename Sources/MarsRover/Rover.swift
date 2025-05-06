struct RoverState {
    var xCoordinate: Int = 0
    var yCoordinate: Int = 0
    var direction: Character = "N"
}

class Rover {
    private var roverState = RoverState()

    init(_ position: String = "") {
        let segment = position.split(separator: " ")
        if segment.count >= 3 {
            roverState.xCoordinate = Int(segment[0]) ?? 0
            roverState.yCoordinate = Int(segment[1]) ?? 0
            roverState.direction = segment[2].first ?? "N"
        }
    }

    func followInstructions(_ commandString: String) {
        for char in commandString {
            guard let command = Command(rawValue: char) else { continue }

            switch command {
            case .left:
                switch roverState.direction {
                case "E": roverState.direction = "N"
                case "N": roverState.direction = "W"
                case "W": roverState.direction = "S"
                case "S": roverState.direction = "E"
                default: break
                }
            case .right:
                switch roverState.direction {
                case "E": roverState.direction = "S"
                case "S": roverState.direction = "W"
                case "W": roverState.direction = "N"
                case "N": roverState.direction = "E"
                default: break
                }
            case .move:
                switch roverState.direction {
                case "E": roverState.xCoordinate += 1
                case "S": roverState.yCoordinate -= 1
                case "W": roverState.xCoordinate -= 1
                case "N": roverState.yCoordinate += 1
                default: break
                }
            }
        }
    }

    enum Command: Character {
        case left = "L"
        case right = "R"
        case move = "M"
    }

    func endPosition() -> String {
        return "\(roverState.xCoordinate) \(roverState.yCoordinate) \(roverState.direction)"
    }
}
