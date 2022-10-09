import Foundation
@testable import ChessTimerTddProcess


class PlayerTimerPresenterSpy: PlayerTimerPresenterProtocol {
    
    var timer = 0
    
    func displayPlayerOneTimer(playerOneTimer: Int) {
        timer = playerOneTimer
    }
    
    func startGame(gameTime: Int) {
        timer = gameTime
    }
    
    func loadPresenter() {
        
    }
    
    func accessPlayerOne() {
        
    }
    
}
