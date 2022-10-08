import Foundation

protocol GameProtocol {
    func gameStart(gameTime: Int)
    func resumePlayerOne()
    func getCurrentPlayer() -> Player?
}

class Game: GameProtocol {
    
    weak var presenter: PlayerTimerPresenterProtocol?
    private var playerOne: Player?
    private var playerTwo: Player?
    private var currentPlayer: Player?
    private var playerOneTimer: Timer?
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
    
    func gameStart(gameTime: Int) {
        playerOne = Player(playerId: 1, state: .start, totalTime: gameTime)
        playerTwo = Player(playerId: 2, state: .stop, totalTime: gameTime)
        resumePlayerOne()
    }
    
    func resumePlayerOne() {
        currentPlayer = playerOne
        playerOneTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatePlayerOneTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayerOneTimer() {
        if let timer = playerOne?.timeLeft, timer >= 0 {
            presenter?.displayPlayerOneTimer(playerOneTimer: timer)
            return
        }
    }
    
    func getCurrentPlayer() -> Player? {
        return currentPlayer
    }
}
