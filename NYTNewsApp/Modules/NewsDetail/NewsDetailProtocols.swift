import Foundation

//MARK: Presenter -> Router
protocol NewsDetailWireframeProtocol: AnyObject {
    func goToCompleteNew(url:String)
}

//MARK: View -> Presenter
protocol NewsDetailPresenterProtocol: AnyObject {
    var new: NewEntity {get set}
    func getNewsDetail()
    func goToCompleteNew()
}


//MARK: Presenter -> View
protocol NewsDetailViewProtocol: AnyObject {
    var presenter: NewsDetailPresenterProtocol?  { get set }
    func updateView()
}

