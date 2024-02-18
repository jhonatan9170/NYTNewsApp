import UIKit

class NewsDetailPresenter {
    
    weak private var view: NewsDetailViewProtocol?
    private let router: NewsDetailWireframeProtocol
    
    var new: NewEntity
    
    init(interface: NewsDetailViewProtocol, router: NewsDetailWireframeProtocol, new:NewEntity) {
        self.view = interface
        self.router = router
        self.new = new
       
    }
}

extension NewsDetailPresenter: NewsDetailPresenterProtocol {

    func goToCompleteNew() {
        router.goToCompleteNew(url: new.webURL)
    }
    
    func getNewsDetail(){
        self.view?.updateView()
    }
}
