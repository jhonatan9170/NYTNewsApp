import UIKit

class HomePresenter {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol
    
    private var _news = [NewEntity]()

    
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
        
    func loadNews() {
        interactor?.loadNews(page: 1)
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
        view?.showNews()
    }
    
    func newsListFailed(error: String) {
        router.showAlertWith(message: error)
    }
}

