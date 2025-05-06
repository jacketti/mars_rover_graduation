class RoverState {
    var xx: Int = 0
    var yy: Int = 0
    var dd: Character = "N"
}

class Rover {
    private var roverState = RoverState()
    
    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            roverState.xx = Int(s[0]) ?? 0
            roverState.yy = Int(s[1]) ?? 0
            roverState.dd = s[2].first ?? "N"
        }
    }
    
    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch roverState.dd { case "E": roverState.dd = "N" case "N": roverState.dd = "W" case "W": roverState.dd = "S" case "S": roverState.dd = "E" default: break }
            case "R":
                switch roverState.dd { case "E": roverState.dd = "S" case "S": roverState.dd = "W" case "W": roverState.dd = "N" case "N": roverState.dd = "E" default: break }
            case "M":
                switch roverState.dd { case "E": roverState.xx += 1 case "S": roverState.yy -= 1 case "W": roverState.xx -= 1 case "N": roverState.yy += 1 default: break }
            default:
                break
            }
        }
    }
    
    func g(_ z: Character) {
        go(String(z))
    }
    
    func pos() -> String {
        return "\(roverState.xx) \(roverState.yy) \(roverState.dd)"
    }
}
