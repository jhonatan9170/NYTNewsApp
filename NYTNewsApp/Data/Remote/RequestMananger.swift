
import Foundation
import Alamofire

class RequestManager {
    
    func makeRequest<T: Decodable>(_ method: HTTPMethod,
                                   model: T.Type,
                                   endpoint: String,
                                   parameters: Parameters? = nil,
                                   encoding: ParameterEncoding = URLEncoding.default,
                                   successRequest: @escaping (T) -> Void,
                                   errorRequest: @escaping (AFError) -> Void) {
        
        let params: Parameters = parameters ?? [:]
        
        debugPrint("=== ENDPOINT ===> \(endpoint)")
        debugPrint("=== PARAMETERS ===> \(params.description)")
        
        AF.request(endpoint, method: method, parameters: params, encoding: encoding, headers: nil).responseDecodable(of: T.self) { response in
            print(response)
            if let error = response.error {
                errorRequest(error)
                debugPrint("=== ¡¡¡ERROR!!! ===")
            }
            
            switch response.result {
            case .success(let modelResponse):
                successRequest(modelResponse)
            case .failure(let error):
                errorRequest(error)
                debugPrint(error)
            }
        }
        
    }
}
