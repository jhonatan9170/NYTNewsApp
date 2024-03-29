import UIKit

class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let router:  HomeWireframeProtocol
    
    private var _news = [NewsModel]()
    private var _typeNewsPopular: TypeNewsPopular = .emailed
    private var _typePeriodTime: TypePeriodTime = .oneDay
    
    init(interactor: HomeInteractorInputProtocol, router: HomeWireframeProtocol) {
        self.interactor = interactor
        self.router = router
        interactor.setPresenterProtocol(presenter: self)
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    var news: [NewsModel] {
        get {
            return _news
        }
        set {
            _news = newValue
        }
    }
        
    var typeNewsPopular: TypeNewsPopular{
        get {
            return _typeNewsPopular
        }
        set {
            if _typeNewsPopular != newValue {
                _typeNewsPopular = newValue
                loadNews()
            }else {
                view?.showNews()
            }
        }
    }
    var typePeriodTime: TypePeriodTime{
        get {
            return _typePeriodTime
        }
        set {
            if  _typePeriodTime != newValue{
                _typePeriodTime = newValue
                loadNews()
            }else {
                view?.showNews()
            }
        }
    }
    
    func setViewProtocol(view: HomeViewProtocol) {
        self.view = view
    }
    
    
    func loadNews() {
        interactor.loadNews(typeNewsPopular: _typeNewsPopular, typePeriodTime: _typePeriodTime)
    }
    
    func newCellAtIndex(_ index: Int) -> NewsModel {
        return _news[index]
    }
    
    func goToDetailView(withIndex index: Int) {
        let new = _news[index]
        router.goToDetailView(new: new)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func newsListDidFetch(newList: [NewsResult]) {
        _news = newList.map{NewsModel(newsResult: $0)}
        interactor.saveNewsDataStorage(newData: _news)
        view?.showNews()
    }
    
    func newsListFailed(error: String) {
        router.showAlertWith(message: error)
        interactor.loadNewsDataStorage()
    }
    
    func newsDataStorageDidFetch(_ news: [NewsData]) {
        _news = news.map{NewsModel(newsData: $0)}
        view?.showNews()
    }
    
}

