import UIKit

class NewsDetailPresenter {
    
    private let router: NewsDetailWireframeProtocol
    var new: NewsModel
    
    init(router: NewsDetailWireframeProtocol, new:NewsModel) {
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
}
