import UIKit

class HomeRouter: HomeWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
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
