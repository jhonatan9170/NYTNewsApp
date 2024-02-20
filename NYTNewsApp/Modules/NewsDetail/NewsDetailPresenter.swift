import UIKit

class NewsDetailPresenter {
    
    weak private var view: NewsDetailViewProtocol?
    private let router: NewsDetailWireframeProtocol
    
    var new: NewsModel
    
    init(interface: NewsDetailViewProtocol, router: NewsDetailWireframeProtocol, new:NewsModel) {
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
