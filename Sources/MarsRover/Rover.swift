class RoverState {
    var xx: Int = 0
    var yy: Int = 0
    var dd: Character = "N"
}

class Rover {
    private var rs = RoverState()
    
    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            rs.xx = Int(s[0]) ?? 0
            rs.yy = Int(s[1]) ?? 0
            rs.dd = s[2].first ?? "N"
        }
    }
    
    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch rs.dd { case "E": rs.dd = "N" case "N": rs.dd = "W" case "W": rs.dd = "S" case "S": rs.dd = "E" default: break }
            case "R":
                switch rs.dd { case "E": rs.dd = "S" case "S": rs.dd = "W" case "W": rs.dd = "N" case "N": rs.dd = "E" default: break }
            case "M":
                switch rs.dd { case "E": rs.xx += 1 case "S": rs.yy -= 1 case "W": rs.xx -= 1 case "N": rs.yy += 1 default: break }
            default:
                break
            }
        }
    }
    
    func g(_ z: Character) {
        go(String(z))
    }
    
    func pos() -> String {
        return "\(rs.xx) \(rs.yy) \(rs.dd)"
    }
}
