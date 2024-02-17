import UIKit
import IHProgressHUD

extension UIViewController {
    func showLoadingView(status: String? = nil) {
        IHProgressHUD.show(withStatus: status)
        IHProgressHUD.set(defaultStyle: .dark)
    }
    
    func dismissLoading() {
        IHProgressHUD.dismiss()
    }
    
    func setupNavigationMultilineTitle() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        for sview in navigationBar.subviews {
            for ssview in sview.subviews {
                guard let label = ssview as? UILabel else { break }
                if label.text == self.title {
                    label.numberOfLines = 0
                    label.lineBreakMode = .byWordWrapping
                    label.sizeToFit()
                    UIView.animate(withDuration: 0.3, animations: {
                        navigationBar.frame.size.height = 57 + label.frame.height
                    })
                }
            }
        }
    }
    
    func setupNavBar(){
        let imageView = UIImageView(image:  UIImage(named: "nytimes_03"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
