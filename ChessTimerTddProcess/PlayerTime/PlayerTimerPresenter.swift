import Foundation

import Foundation

protocol PlayerTimerPresenterProtocol: AnyObject {
    func loadPresenter()
    func startGame(gameTime: Int)
    func displayPlayerOneTimer(playerOneTimer: Int)
    func displayPlayerTwoTimer(playerTwoTimer: Int)
    func accessPlayerOne()
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
        let gameState = game?.getGameState()
        
        if gameState == .resume || gameState == .start {
            self.game?.pauseGame()
            return
        }
    
        game?.gameStart(gameTime: gameTime)
    }
    
    func accessPlayerOne() {
        let gameState = game?.getGameState()
        let player = game?.getCurrentPlayer()
        
        if (gameState == .resume || gameState == .start) && player == 1 {
            game?.stopPlayerOneTimer()
            game?.resumePlayerTwoTimer()
        }
    }
    
    func displayPlayerOneTimer(playerOneTimer: Int) {
        self.controller?.setPlayerOneLabelTimer(timer: "\(playerOneTimer)")
    }
    
    func displayPlayerTwoTimer(playerTwoTimer: Int) {
        self.controller?.setPlayerTwoLabelTimer(timer: "\(playerTwoTimer)")
    }
}
