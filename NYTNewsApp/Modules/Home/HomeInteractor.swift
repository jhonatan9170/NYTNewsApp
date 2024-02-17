import UIKit

class HomeInteractor: HomeInteractorInputProtocol {

    weak var presenter: HomeInteractorOutputProtocol?
    
    var newsService: NewsServiceProtocol = NewsService()
    
    
    func loadNews(page: Int) {
        newsService.requestToGetNews(page: page){ [weak self] news in
            if let news {
                self?.presenter?.newsListDidFetch(newList: news)
            } else {
                self?.presenter?.newsListFailed(error: "Error fetching news")
            }
        }
    }
}
