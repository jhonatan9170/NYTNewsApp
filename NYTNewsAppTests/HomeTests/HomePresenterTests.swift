import XCTest
@testable import NYTNewsApp

class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var mockInteractor: MockHomeInteractor!
    var mockRouter: MockHomeRouter!
    var mockView: MockHomeView!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockHomeInteractor()
        mockRouter = MockHomeRouter()
        mockView = MockHomeView()
        sut = HomePresenter(interactor: mockInteractor, router: mockRouter)
        sut.setViewProtocol(view: mockView)
    }
    
    override func tearDown() {
        mockInteractor = nil
        mockRouter = nil
        mockView = nil
        sut = nil
        super.tearDown()
    }
    
    func testLoadNews() {
        // When
        sut.loadNews()
        
        // Then
        XCTAssertTrue(mockInteractor.loadNewsCalled)
    }
    
    func testTypeNewsPopularChange() {
        // When
        sut.typeNewsPopular = .viewed
        
        // Then
        XCTAssertTrue(mockInteractor.loadNewsCalled)
    }
    
    func testTypePeriodTimeChange() {
        // When
        sut.typePeriodTime = .oneWeek
        
        // Then
        XCTAssertTrue(mockInteractor.loadNewsCalled)
    }
    
    func testNewCellAtIndex() {
        // Given
        let index = 1
        let new1 = NewsModel(id: 1, category: "Category 1", title: "Title 1", byline: "Byline 1", abstract: "Abstract 1", date: "2024-02-19", imageURL: nil, webURL: nil)
        let new2 = NewsModel(id: 2, category: "Category 2", title: "Title 2", byline: "Byline 2", abstract: "Abstract 2", date: "2024-02-19", imageURL: nil, webURL: nil)
        let news = [new1,new2]
        sut.news = news
        
        // When
        let newsModel = sut.newCellAtIndex(index)
        
        // Then
        XCTAssertEqual(newsModel, new2)
    }
    
    func testGoToDetailView() {
        // Given
        let index = 1
        let new1 = NewsModel(id: 1, category: "Category 1", title: "Title 1", byline: "Byline 1", abstract: "Abstract 1", date: "2024-02-19", imageURL: nil, webURL: nil)
        let new2 = NewsModel(id: 2, category: "Category 2", title: "Title 2", byline: "Byline 2", abstract: "Abstract 2", date: "2024-02-19", imageURL: nil, webURL: nil)
        let news = [new1,new2]
        sut.news = news

        
        // When
        sut.goToDetailView(withIndex: index)
        
        // Then
        XCTAssertTrue(mockRouter.goToDetailCalled)
        XCTAssertEqual(mockRouter.new, new2)
    }
    
    func testNewsListDidFetch() {
        // Given
        let newsListResult = [NewsResult(uri: "uri", url: "url", id: 1, assetID: 1, publishedDate: "date", updated: "updated", section: "section", subsection: "subsection", nytdsection: "nytdsection", adxKeywords: "adxKeywords", byline: "byline", title: "title", abstract: "abstract", desFacet: ["des"], orgFacet: ["org"], perFacet: ["per"], geoFacet: ["geo"], media: [NewMedia(caption: "caption", copyright: "copyright", approvedForSyndication: 1, mediaMetadata: [NewsMediaMetadata(url: "Imgurl")])], etaID: 1)]
        let newList = [NewsModel(id: 1, category: "section", title: "title", byline: "byline", abstract: "abstract", date: "date", imageURL: "Imgurl", webURL: "url")]
        
        // When
        sut.newsListDidFetch(newList: newsListResult)
        
        // Then
        XCTAssertEqual(sut.news,newList)
        XCTAssertTrue(mockInteractor.saveNewsDataStorage)
        XCTAssertEqual(mockInteractor.news,newList)
        XCTAssertTrue(mockView.showNewsCalled)
        
    
    }
    
    func testNewsListFailed() {
        // Given
        let errorMessage = "An error occurred"
        
        // When
        sut.newsListFailed(error: errorMessage)
        
        // Then
        XCTAssertTrue(mockRouter.showAlertWithMessageCalled)
        XCTAssertEqual(mockRouter.receivedMessage, errorMessage)
        XCTAssertTrue(mockInteractor.loadNewsDataStorageCalled)
    }
}
