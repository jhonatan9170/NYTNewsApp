import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    
    
    weak var presenter: HomeInteractorOutputProtocol?
    
    var newsService: NewsServiceProtocol = NewsService()
    var coreDataMananger = CoreDataManager.shared
    
    func loadNews(typeNewsPopular: TypeNewsPopular, typePeriodTime: TypePeriodTime) {
        newsService.requestToGetNews(typeNewsPopular: typeNewsPopular, typePeriodTime: typePeriodTime){ [weak self] news in
            if let news {
                self?.presenter?.newsListDidFetch(newList: news)
            } else {
                self?.presenter?.newsListFailed(error: "Error fetching news")
            }
        }
    }
    
    func saveNewsDataStorage(newData: [NewEntity]) {
        for new in newData {
            coreDataMananger.saveNew(new: new)
        }
       
    }
    
    func loadNewsDataStorage(){
        let newsData = coreDataMananger.fetchNews()
        presenter?.newsDataStorageDidFetch(newsData)
    }
    
}
