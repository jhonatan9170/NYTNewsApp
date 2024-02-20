@testable import NYTNewsApp

class MockHomeInteractor: HomeInteractorInputProtocol {
    
    var loadNewsCalled = false
    var loadNewsDataStorageCalled = false
    var saveNewsDataStorage = false

    var news:[NewsModel]?
    
    func setPresenterProtocol(presenter: HomeInteractorOutputProtocol) {
    }
    
    func loadNews(typeNewsPopular: TypeNewsPopular, typePeriodTime: TypePeriodTime) {
        loadNewsCalled = true
    }
    
    func saveNewsDataStorage(newData: [NewsModel]) {
        saveNewsDataStorage = true
        self.news = newData

    }
    
    func loadNewsDataStorage() {
        loadNewsDataStorageCalled = true
    }
    

}
