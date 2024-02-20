import UIKit

class HomeRouter: HomeWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)
        let view = HomeViewController(presenter: presenter)
        router.viewController = view

        return view
    }
    
    func showAlertWith(message: String) {
        let alert = UIAlertController(title: "News", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default)
        alert.addAction(okAction)
        viewController?.present(alert, animated: true)
    }
    
    func goToDetailView(new: NewsModel) {
        if let nav = viewController?.navigationController {
            let vc = NewsDetailRouter.createModule(new: new)
            nav.pushViewController(vc, animated: true)
        }
    }
    
}
