import UIKit

protocol PlayerTimerViewProtocol: AnyObject {
    func setTitle(title: String)
    func setPlayerOneLabelTimer(timer: String)
    func setPlayerTwoLabelTimer(timer: String)
}

class PlayerTimerViewController: UIViewController {
    
    private var presenter: PlayerTimerPresenterProtocol?
    private let gameTimer = 20
    @IBOutlet weak var labelPlayerOneTimer: UILabel!
    
    @IBOutlet weak var labelPlayerTwoTimer: UILabel!
    
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
    
    @IBAction func buttonGameSettingClicked(_ sender: Any) {
        self.presenter?.startGame(gameTime: gameTimer)
    }
    
    @IBAction func playerOneButtonPressed(_ sender: Any) {
        self.presenter?.accessPlayerOne()
    }
    
    @IBAction func playerTwoButtonPressed(_ sender: Any) {
        presenter?.accessPlayerTwo()
    }
}

extension PlayerTimerViewController : PlayerTimerViewProtocol {
    func setTitle(title: String) {
        self.title = title
    }
    
    func setPlayerOneLabelTimer(timer: String) {
        labelPlayerOneTimer.text = timer
    }
    
    func setPlayerTwoLabelTimer(timer: String) {
        labelPlayerTwoTimer.text = timer
    }
}
