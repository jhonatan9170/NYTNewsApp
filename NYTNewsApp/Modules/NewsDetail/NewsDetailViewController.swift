
import UIKit
import Kingfisher

class NewsDetailViewController: UIViewController {
    
    private let presenter: NewsDetailPresenterProtocol
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var abstractLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var urlLabel: UILabel = {
        let label = UILabel()
        label.text = "Read"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(urlLabelTapped))
        urlLabel.addGestureRecognizer(tapGesture)
        setupView()
    }
    
    init(presenter: NewsDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func urlLabelTapped() {
        presenter.goToCompleteNew()
    }
    
    func setupView() {
        view.backgroundColor = .white
        configureConstraints()
        setupNavBarImage()
        setupNavBarBack()
        if let url = presenter.new.imageURL{
            newsImageView.kf.setImage(with: URL(string: url))
        }
        titleLabel.text = presenter.new.title
        authorLabel.text = presenter.new.byline
        categoryLabel.text = presenter.new.category
        abstractLabel.text = presenter.new.abstract
        dateLabel.text = presenter.new.date
        urlLabel.isHidden = presenter.new.webURL == nil
    }
}
