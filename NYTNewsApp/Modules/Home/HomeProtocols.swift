import Foundation

//MARK: Presenter -> Router
protocol HomeWireframeProtocol: AnyObject {
    func showAlertWith(message: String)
    func goToDetailView(new: NewsModel)
}

//MARK: View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    
    var news: [NewsModel] {get set}
    var typeNewsPopular: TypeNewsPopular{get set}
    var typePeriodTime: TypePeriodTime {get set}
    
    func setViewProtocol(view: HomeViewProtocol)
    func loadNews()
    func newCellAtIndex(_ index : Int) -> NewsModel
    func goToDetailView(withIndex index: Int)
}

//MARK: Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func newsListDidFetch(newList: [NewsResult])
    func newsListFailed(error:String)
    func newsDataStorageDidFetch(_ news: [NewsData])
}

//MARK: Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    func setPresenterProtocol(presenter: HomeInteractorOutputProtocol)
    func loadNews(typeNewsPopular: TypeNewsPopular, typePeriodTime: TypePeriodTime)
    func saveNewsDataStorage(newData:[NewsModel])
    func loadNewsDataStorage()
}

//MARK: Presenter -> View
protocol HomeViewProtocol: AnyObject {
    func showNews()
}
