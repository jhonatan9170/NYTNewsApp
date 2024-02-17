import Foundation

class Constants {
    
    static let key = "o1wVFPZyo3b2VlPsTJOmVCjks0A0TACw"
    static let baseAPIURL = "https://api.nytimes.com/svc/mostpopular/v2"
    static func generateAPIURL(typeNewsPopular:TypeNewsPopular, page: Int) -> String {
        return "https://api.nytimes.com/svc/mostpopular/v2\(typeNewsPopular.rawValue)/\(page).json?api-key=\(key)"
    }
}

enum TypeNewsPopular:String {
    case emailed = "/emailed"
    case shared = "/shared"
    case viewed = "/viewed"
}
