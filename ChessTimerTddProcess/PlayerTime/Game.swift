import Foundation

protocol GameProtocol {
}

class Game: GameProtocol {
    
    weak var presenter: PlayerTimerPresenterProtocol?
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
    
}
