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
        if let url = new.webURL{
            router.goToCompleteNew(url: url)
        }
    }
    
    func getNewsDetail(){
        self.view?.updateView()
    }
}
