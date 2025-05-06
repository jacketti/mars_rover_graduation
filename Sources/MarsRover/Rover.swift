class RoverState {
    var xCoordinate: Int = 0
    var yCoordinate: Int = 0
    var direction: Character = "N"
}

class Rover {
    private var roverState = RoverState()

    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            roverState.xCoordinate = Int(s[0]) ?? 0
            roverState.yCoordinate = Int(s[1]) ?? 0
            roverState.direction = s[2].first ?? "N"
        }
    }

    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch roverState.direction {
                case "E": roverState.direction = "N"
                case "N": roverState.direction = "W"
                case "W": roverState.direction = "S"
                case "S": roverState.direction = "E"
                default: break
                }
            case "R":
                switch roverState.direction {
                case "E": roverState.direction = "S"
                case "S": roverState.direction = "W"
                case "W": roverState.direction = "N"
                case "N": roverState.direction = "E"
                default: break
                }
            case "M":
                switch roverState.direction {
                case "E": roverState.xCoordinate += 1
                case "S": roverState.yCoordinate -= 1
                case "W": roverState.xCoordinate -= 1
                case "N": roverState.yCoordinate += 1
                default: break
                }
            default:
                break
            }
        }
    }

    func g(_ z: Character) {
        go(String(z))
    }

    func endPosition() -> String {
        return "\(roverState.xCoordinate) \(roverState.yCoordinate) \(roverState.direction)"
    }
}
