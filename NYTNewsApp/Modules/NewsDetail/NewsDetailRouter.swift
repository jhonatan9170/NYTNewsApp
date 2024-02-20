import UIKit

class NewsDetailRouter: NewsDetailWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(new: NewsModel) -> UIViewController {
        let router = NewsDetailRouter()
        let presenter = NewsDetailPresenter(router: router, new: new)
        let view = NewsDetailViewController(presenter: presenter)

        router.viewController = view

        return view
    }
    
    func goToCompleteNew(url: String) {
        if let url = URL(string: url), let nav = viewController?.navigationController  {
            let webvc = WebViewController(url: url)
            nav.pushViewController(webvc, animated: true)
        }
    }
    
}
