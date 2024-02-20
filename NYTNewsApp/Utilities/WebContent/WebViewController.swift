
import WebKit

class WebViewController:UIViewController{
    
    let url: URL
    lazy var webView = WKWebView()
    
    init(url: URL){
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupNavBarBack()
        configContraints()
        loadWebView()
    }
    
    func loadWebView() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func configContraints(){
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
