import UIKit

protocol PlayerTimerViewProtocol: AnyObject {
}

class PlayerTimerViewController: UIViewController {
    
    private var presenter: PlayerTimerPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
}

extension PlayerTimerViewController : PlayerTimerViewProtocol {
    
}
