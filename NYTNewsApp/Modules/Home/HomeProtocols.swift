import Foundation

//MARK: Presenter -> Router
protocol HomeWireframeProtocol: AnyObject {
    func showAlertWith(message: String)
    func goToDetailView(new: NewEntity)
}

//MARK: View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorInputProtocol? { get set }
    var news: [NewEntity] {get set}
    
    func loadNews()
    func newCellAtIndex(_ index : Int) -> NewEntity
    func goToDetailView(withIndex index: Int)
}

//MARK: Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func newsListDidFetch(newList: [NewsResult])
    func newsListFailed(error:String)
}

//MARK: Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol?  { get set }
    func loadNews(page: Int)
}

//MARK: Presenter -> View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol?  { get set }
    func showNews()
}
