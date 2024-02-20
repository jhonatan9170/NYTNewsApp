@testable import NYTNewsApp

class MockHomeView: HomeViewProtocol {
    var showNewsCalled = false
    
    func showNews() {
        showNewsCalled = true
    }
}
