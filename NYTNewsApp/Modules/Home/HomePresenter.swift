import UIKit

class HomePresenter {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol
    
    private var _news = [NewEntity]()
    private var _typeNewsPopular: TypeNewsPopular = .emailed
    private var _typePeriodTime: TypePeriodTime = .oneDay
    
    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    var news: [NewEntity] {
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
    
    
    func loadNews() {
        interactor?.loadNews(typeNewsPopular: _typeNewsPopular, typePeriodTime: _typePeriodTime)
    }
    
    func newCellAtIndex(_ index: Int) -> NewEntity {
        return _news[index]
    }
    
    func goToDetailView(withIndex index: Int) {
        let new = _news[index]
        router.goToDetailView(new: new)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func newsListDidFetch(newList: [NewsResult]) {
        _news = newList.map{$0.newEntity}
        interactor?.saveNewsDataStorage(newData: _news)
        view?.showNews()
    }
    
    func newsListFailed(error: String) {
        router.showAlertWith(message: error)
        interactor?.loadNewsDataStorage()
    }
    
    func newsDataStorageDidFetch(_ news: [NewsData]) {
        _news = news.map{$0.newEntity}
        view?.showNews()
    }
    
}

