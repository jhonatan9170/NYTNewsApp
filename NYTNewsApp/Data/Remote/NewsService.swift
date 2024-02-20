
import Foundation

protocol NewsServiceProtocol{
    func requestToGetNews(typeNewsPopular:TypeNewsPopular,typePeriodTime:TypePeriodTime,completion: @escaping ([NewsResult]?) -> Void)
}
class NewsService: RequestManager {
    
}

extension NewsService: NewsServiceProtocol {
    func requestToGetNews(typeNewsPopular:TypeNewsPopular,typePeriodTime:TypePeriodTime,completion: @escaping ([NewsResult]?) -> Void) {
        let endpoint = Constants.generateAPIURL(typeNewsPopular: typeNewsPopular ,typePeriodTime: typePeriodTime)
        makeRequest(.get, model: NewsResponse.self, endpoint: endpoint, successRequest: { response in
            completion(response.results)
        }) { _ in
            completion(nil)
        }
    }
}

