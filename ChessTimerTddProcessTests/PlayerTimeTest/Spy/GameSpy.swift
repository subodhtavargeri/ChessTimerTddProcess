import Foundation
@testable import ChessTimerTddProcess

class GameSpy: GameProtocol {
    
    var time = 0
    func gameStart(gameTime: Int) {
        time = gameTime
    }
}
