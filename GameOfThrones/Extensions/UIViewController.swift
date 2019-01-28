import UIKit

extension UIViewController {
    func showErrorAlert(error: Error) -> Void {
        let alert = UIAlertController(title: "Oops!", message: "It was not possible to make your request. Check your connection and Pull to reload", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
