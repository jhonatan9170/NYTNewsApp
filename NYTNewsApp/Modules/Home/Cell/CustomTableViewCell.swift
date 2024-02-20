
import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var abstractLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView :UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,newsImageView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraint()
    }
    
    func configCell(new:NewsModel){
        categoryLabel.text = new.category
        titleLabel.text = new.title
        abstractLabel.text = new.abstract
        dateLabel.text = new.date
        if let imageURL = new.imageURL{
            newsImageView.kf.setImage(with: URL(string: imageURL))
        }
    }
    
    func setupContraint() {
        addSubview(stackView)
        addSubview(categoryLabel)
        addSubview(abstractLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            newsImageView.widthAnchor.constraint(equalToConstant: 120),
            newsImageView.heightAnchor.constraint(equalToConstant: 80),
            
            abstractLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            abstractLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            abstractLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: abstractLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
