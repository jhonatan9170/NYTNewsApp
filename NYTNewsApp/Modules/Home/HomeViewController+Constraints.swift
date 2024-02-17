
import UIKit

extension HomeViewController{

    func configureConstraints() {
        view.addSubview(newsTableView)
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
