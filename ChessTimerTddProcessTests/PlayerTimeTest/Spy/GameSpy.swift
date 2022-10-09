import Foundation
@testable import ChessTimerTddProcess

class GameSpy: GameProtocol {
  
    var time = 0
    var resumePlayer = ""
    
    func gameStart(gameTime: Int) {
        time = gameTime
    }
    
    func getCurrentPlayer() -> Player? {
        return Player(playerId: 1, state: .start, totalTime: 2)
    }
    
    func resumePlayerOneTimer() {
        resumePlayer = "PlayerOne"
    }
    
    func resumePlayerTwoTimer() {
        resumePlayer = "PlayerTwo"
    }
    
    func getCurrentPlayer() -> Int {
        return 1
    }
    
    func getGameState() -> GameState? {
        return .start
    }
    
    func stopPlayerOneTimer() {
        time = 0
    }
    
    func pauseGame() {
        time = 10
    }
    
    func stopPlayerTwoTimer() {
        time = 0
    }
    
    
}
