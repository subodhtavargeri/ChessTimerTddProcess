import Foundation

import Foundation

protocol PlayerTimerPresenterProtocol: AnyObject {
    func loadPresenter()
}

class PlayerTimerPresenter: PlayerTimerPresenterProtocol {

    weak var controller: PlayerTimerViewProtocol?
    let game: GameProtocol?
    
    init(controller: PlayerTimerViewProtocol,
         game: GameProtocol) {
        self.controller = controller
        self.game = game
    }
    
    func loadPresenter() {
        setTitle()
    }
    
    private func setTitle() {
        controller?.setTitle(title: "Game Timer")
    }
    
}
