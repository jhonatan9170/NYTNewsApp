import Foundation

class Constants {
    
    static let key = "o1wVFPZyo3b2VlPsTJOmVCjks0A0TACw"
    static let baseAPIURL = "https://api.nytimes.com/svc/mostpopular/v2"
    static func generateAPIURL(typeNewsPopular:TypeNewsPopular, typePeriodTime: TypePeriodTime) -> String {
        return "https://api.nytimes.com/svc/mostpopular/v2\(typeNewsPopular.rawValue)/\(typePeriodTime.rawValue).json?api-key=\(key)"
    }
}

enum TypeNewsPopular:String {
    case emailed = "/emailed"
    case shared = "/shared"
    case viewed = "/viewed"
}

enum TypePeriodTime: Int {
    case oneDay = 1
    case oneWeek = 7
    case oneMonth = 30
}
