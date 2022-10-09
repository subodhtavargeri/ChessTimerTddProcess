import Foundation

protocol GameProtocol {
    func gameStart(gameTime: Int)
    func resumePlayerOne()
    func getCurrentPlayer() -> Int
    func getGameState() -> GameState
}

class Game: GameProtocol {
    
    weak var presenter: PlayerTimerPresenterProtocol?
    private var playerOne: Player?
    private var playerTwo: Player?
    private var currentPlayer: Int?
    private var playerOneTimer: Timer?
    private var gameState: GameState?
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
    
    func gameStart(gameTime: Int) {
        playerOne = Player(playerId: 1, state: .start, totalTime: gameTime)
        playerTwo = Player(playerId: 2, state: .stop, totalTime: gameTime)
        gameState = .start
        resumePlayerOne()
    }
    
    func resumePlayerOne() {
        currentPlayer = playerOne?.playerId
        playerOneTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatePlayerOneTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayerOneTimer() {
        if let timer = playerOne?.timeLeft, timer >= 0 {
            presenter?.displayPlayerOneTimer(playerOneTimer: timer)
            return
        }
    }
    
    func getCurrentPlayer() -> Int {
        return currentPlayer ?? 1
    }
    
    func getGameState() -> GameState {
        return gameState ?? .start
    }
}
