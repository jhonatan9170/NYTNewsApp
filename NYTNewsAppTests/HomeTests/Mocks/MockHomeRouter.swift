
@testable import NYTNewsApp

class MockHomeRouter: HomeWireframeProtocol {
    
    var showAlertWithMessageCalled = false
    var receivedMessage: String?
    var goToDetailCalled = false
    var new: NewsModel?
    
    func showAlertWith(message: String) {
        showAlertWithMessageCalled = true
        receivedMessage = message
    }
    
    func goToDetailView(new: NewsModel) {
        goToDetailCalled = true
        self.new = new
    }
}
