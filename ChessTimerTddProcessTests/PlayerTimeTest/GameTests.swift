import Foundation
@testable import ChessTimerTddProcess
import XCTest

class GameTests: XCTestCase {
    
    func testGameStartEvent() {
        let game = Game()
        let presenter = PlayerTimerPresenterSpy()
        game.setup(presenter: presenter)
        
        game.gameStart(gameTime: 2)
        
        XCTAssertNotNil(game.getCurrentPlayer())
    }
    
    func testGetCurrentPlayer() {
        let game = Game()
        let presenter = PlayerTimerPresenterSpy()
        game.setup(presenter: presenter)
        
        game.gameStart(gameTime: 2)
        
        XCTAssertNotNil(game.getCurrentPlayer())
    }
    
    func testResumePlayerOne() {
        let game = Game()
        let presenter = PlayerTimerPresenterSpy()
        game.setup(presenter: presenter)
        
        game.resumePlayerOne()
        
        let expectation = 1
        XCTAssertEqual(game.getCurrentPlayer(), expectation)
    }
    
    func testPlayerOneTImerIsStopped() {
        let game = Game()
        let presenter = PlayerTimerPresenterSpy()
        game.setup(presenter: presenter)
        
        game.stopPlayerOneTimer()
        
        let expectation = 1
        XCTAssertEqual(game.getCurrentPlayer(), expectation)
    }
    
    func testWhneGameIsPaused() {
        let game = Game()
        let presenter = PlayerTimerPresenterSpy()
        game.setup(presenter: presenter)
        
        game.pauseGame()
        
        let expectation = GameState.paused
        XCTAssertEqual(game.getGameState(),expectation)
    }
}
