import Foundation

import Foundation

protocol PlayerTimerPresenterProtocol:AnyObject {
}

class PlayerTimerPresenter: PlayerTimerPresenterProtocol {

    weak var controller: PlayerTimerViewProtocol?
    let game: GameProtocol?
    
    init(controller: PlayerTimerViewProtocol,
         game: GameProtocol) {
        self.controller = controller
        self.game = game
    }
    
}
