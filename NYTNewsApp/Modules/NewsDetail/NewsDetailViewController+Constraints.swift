
import UIKit

extension NewsDetailViewController{
    func configureConstraints(){
        view.addSubview(titleLabel)
        view.addSubview(authorLabel)
        view.addSubview(newsImageView)
        view.addSubview(categoryLabel)
        view.addSubview(abstractLabel)
        view.addSubview(dateLabel)
        view.addSubview(urlLabel)
        
        NSLayoutConstraint.activate([
          
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            newsImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsImageView.heightAnchor.constraint(equalTo: newsImageView.widthAnchor, multiplier: 0.666),
            
            categoryLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 2),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            abstractLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            abstractLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            abstractLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            urlLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            urlLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor)
        ])
    }
}
