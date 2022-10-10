import Foundation

import Foundation

protocol PlayerTimerPresenterProtocol: AnyObject {
    func loadPresenter()
    func startGame(gameTime: Int)
    func displayPlayerOneTimer(playerOneTimer: Int)
    func displayPlayerTwoTimer(playerTwoTimer: Int)
    func accessPlayerOne()
    func accessPlayerTwo()
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
    
    func accessPlayerTwo() {
        let gameState = game?.getGameState()
        let player = game?.getCurrentPlayer()
        
        if (gameState == .resume || gameState == .start) && player == 2 {
            game?.stopPlayerTwoTimer()
            game?.resumePlayerOneTimer()
        }
    }
    
    func displayPlayerOneTimer(playerOneTimer: Int) {
        if playerOneTimer == 0 {
            controller?.setPlayerOneLabelTimer(timer: "Player One Lost")
            controller?.setPlayerTwoLabelTimer(timer: "Player Two Won")
            return
        }
        self.controller?.setPlayerOneLabelTimer(timer: "\(playerOneTimer)")
    }
    
    func displayPlayerTwoTimer(playerTwoTimer: Int) {
        if playerTwoTimer == 0 {
            controller?.setPlayerOneLabelTimer(timer: "Player One Won")
            controller?.setPlayerTwoLabelTimer(timer: "Player Two Lost")
            return
        }
        self.controller?.setPlayerTwoLabelTimer(timer: "\(playerTwoTimer)")
    }
}
