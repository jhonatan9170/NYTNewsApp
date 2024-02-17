
import Foundation

protocol NewsServiceProtocol{
    func requestToGetNews(page:Int,completion: @escaping ([NewsResult]?) -> Void)
}
class NewsService: RequestManager {
    
}

extension NewsService: NewsServiceProtocol {
    func requestToGetNews(page:Int,completion: @escaping ([NewsResult]?) -> Void) {
        let endpoint = Constants.generateAPIURL(typeNewsPopular: .emailed, page: page)
        makeRequest(.get, model: NewsResponse.self, endpoint: endpoint, successRequest: { response in
            completion(response.results)
        }) { _ in
            completion(nil)
        }
    }
}

