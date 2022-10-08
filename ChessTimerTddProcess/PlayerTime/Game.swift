import Foundation

protocol GameProtocol {
    func gameStart(gameTime: Int)
}

class Game: GameProtocol {
    
    weak var presenter: PlayerTimerPresenterProtocol?
    var playerOne: Player?
    var playerTwo: Player?
    
    func setup(presenter: PlayerTimerPresenterProtocol) {
        self.presenter = presenter
    }
    
    func gameStart(gameTime: Int) {
        playerOne = Player(playerId: 1, state: .start, totalTime: gameTime)
        playerTwo = Player(playerId: 2, state: .stop, totalTime: gameTime)
    }
}
