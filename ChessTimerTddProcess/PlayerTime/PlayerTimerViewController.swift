import UIKit

protocol PlayerTimerViewProtocol: AnyObject {
    func setTitle(title: String)
    func setPlayerOneLabelTimer(timer: String)
}

class PlayerTimerViewController: UIViewController {
    
    private var presenter: PlayerTimerPresenterProtocol?
    private let gameTimer = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitial()
    }
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
    
    func setupInitial() {
        self.presenter?.loadPresenter()
    }
}

extension PlayerTimerViewController : PlayerTimerViewProtocol {
    func setTitle(title: String) {
        self.title = title
    }
    
    func setPlayerOneLabelTimer(timer: String) {
        
    }
}
