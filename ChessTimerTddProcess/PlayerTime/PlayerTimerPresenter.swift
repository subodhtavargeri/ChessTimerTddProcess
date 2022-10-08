import Foundation

import Foundation

protocol PlayerTimerPresenterProtocol: AnyObject {
    func loadPresenter()
    func startGame(gameTime: Int)
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
    
    func startGame(gameTime: Int) {
        self.game?.gameStart(gameTime: gameTime)
    }
    
}
