import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    
    
    private weak var presenter: HomeInteractorOutputProtocol?
    
    private var newsService: NewsServiceProtocol
    private var coreDataMananger : CoreDataManagerProtocol
    
    init(newsService: NewsServiceProtocol = NewsService(), coreDataMananger: CoreDataManagerProtocol = CoreDataManager.shared) {
        self.newsService = newsService
        self.coreDataMananger = coreDataMananger
    }
    
    func setPresenterProtocol(presenter: HomeInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    
    func loadNews(typeNewsPopular: TypeNewsPopular, typePeriodTime: TypePeriodTime) {
        newsService.requestToGetNews(typeNewsPopular: typeNewsPopular, typePeriodTime: typePeriodTime){ [weak self] news in
            if let news {
                self?.presenter?.newsListDidFetch(newList: news)
            } else {
                self?.presenter?.newsListFailed(error: "Error fetching news")
            }
        }
    }
    
    func saveNewsDataStorage(newData: [NewsModel]) {
        for new in newData {
            coreDataMananger.saveNew(new: new)
        }
       
    }
    
    func loadNewsDataStorage(){
        let newsData = coreDataMananger.fetchNews()
        presenter?.newsDataStorageDidFetch(newsData)
    }
    
    
}
