
import UIKit

class HomeViewController:UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .gray
        tableView.allowsSelection = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.bounces = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter?.loadNews()
    }
    
    func setupViews(){
        configureConstraints()
        setupNavBarImage()
        showLoadingView()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.news.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell, let presenter
        else {
            return UITableViewCell()
        }
        
        let new = presenter.newCellAtIndex(indexPath.row)
        
        cell.configCell(new: new)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetailView(withIndex: indexPath.row)
    }
}

extension HomeViewController: HomeViewProtocol{
    func showNews() {
        dismissLoading()
        newsTableView.reloadData()
    }
}
