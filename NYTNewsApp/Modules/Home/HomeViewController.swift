
import UIKit

class HomeViewController:UIViewController {
    
    private var presenter: HomePresenterProtocol
    private let daysPickerData = ["1 day", "7 days", "30 days"]
    private let popularPickerData = ["emailed", "shared", "viewed"]


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
    
    lazy var daysPickerView : UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var popularityPickerView : UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.backgroundColor = .white

        return picker
    }()
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.setViewProtocol(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter.loadNews()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.clock"), style: .plain, target: self, action: #selector(showPickerDays))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(showPickerPopularity))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setupViews(){
        configureConstraints()
        setupNavBarImage()
        showLoadingView()
    }
    
    
    @objc func showPickerDays() {
        UIView.animate(withDuration: 0.3) {
            self.popularityPickerView.isHidden = true
            self.daysPickerView.isHidden = false
        }
    }
    @objc func showPickerPopularity() {
        UIView.animate(withDuration: 0.3) {
            self.daysPickerView.isHidden = true
            self.popularityPickerView.isHidden = false
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        let new = presenter.newCellAtIndex(indexPath.row)
        
        cell.configCell(new: new)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.goToDetailView(withIndex: indexPath.row)
    }
}

extension HomeViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case daysPickerView:
            return daysPickerData[row]
        case popularityPickerView:
            return popularPickerData[row]
        default:
            break
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.daysPickerView.isHidden = true
        self.popularityPickerView.isHidden = true
        self.showLoadingView()
        switch pickerView {
        case daysPickerView:
            switch row{
            case 0:
                presenter.typePeriodTime = .oneDay
            case 1:
                presenter.typePeriodTime = .oneWeek
            case 2:
                presenter.typePeriodTime = .oneMonth
            default:
                break
            }
        case popularityPickerView:
            switch row{
            case 0:
                presenter.typeNewsPopular = .emailed
            case 1:
                presenter.typeNewsPopular = .shared
            case 2:
                presenter.typeNewsPopular = .viewed
            default:
                break
            }
        default:
            break
        }
    }
}

extension HomeViewController: HomeViewProtocol{
    func showNews() {
        dismissLoading()
        newsTableView.reloadData()
    }
}
