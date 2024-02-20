import Foundation

//MARK: Presenter -> Router
protocol NewsDetailWireframeProtocol: AnyObject {
    func goToCompleteNew(url:String)
}

//MARK: View -> Presenter
protocol NewsDetailPresenterProtocol: AnyObject {
    var new: NewsModel {get set}
    func goToCompleteNew()
}
