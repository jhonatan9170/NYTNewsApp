
import UIKit

extension HomeViewController{

    func configureConstraints() {

        view.addSubview(newsTableView)
        view.addSubview(daysPickerView)
        view.addSubview(popularityPickerView)
        daysPickerView.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)
        popularityPickerView.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)

        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            daysPickerView.heightAnchor.constraint(equalToConstant: 50),
            daysPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            daysPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            daysPickerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
