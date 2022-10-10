import XCTest
@testable import ChessTimerTddProcess

class PlayerTimerPresenterTests: XCTestCase {
    
    func testViewTitleIsSet() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.loadPresenter()
        
        let expected = "Game Timer"
        XCTAssertEqual(view.title, expected)
    }
    
    func testStartGame() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.startGame(gameTime: 10)
        
        let expected = 10
        XCTAssertEqual(game.time,expected)
    }
    
    func testWhenGameIsPaused() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        game.pauseGame()
        presenter.startGame(gameTime: 2)
        
        let expected = 10
        XCTAssertEqual(game.time,expected)
    }
    
    func testWhenGamePlayerOneIsResumed() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        game.resumePlayerOneTimer()
        presenter.startGame(gameTime: 2)
        
        let expected = "PlayerOne"
        XCTAssertEqual(game.resumePlayer,expected)
    }
    
    func testWhenGamePlayerTwoIsResumed() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        game.resumePlayerTwoTimer()
        presenter.startGame(gameTime: 2)
      
        let expected = "PlayerTwo"
        XCTAssertEqual(game.resumePlayer,expected)
    }
    
    func testDisplayPlayerOneTimer() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.displayPlayerOneTimer(playerOneTimer: 2)
        
        let expected = "2"
        XCTAssertEqual(view.title,expected)
    }
 
    func testAccessPlayerOne() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.accessPlayerOne()
        
        let expected = 0
        XCTAssertEqual(game.time,expected)
    }
    
    func testDisplayPlayerTwoTimer() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.displayPlayerTwoTimer(playerTwoTimer: 5)
        
        let expected = "5"
        XCTAssertEqual(view.title,expected)
    }
    
    func testDisplayPlayerTwoWonMessageWhenPlayerOneTimerIsZero() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.displayPlayerOneTimer(playerOneTimer: 0)
        
        let expected = "Player Two Won"
        XCTAssertEqual(view.title,expected)
    }
    
    func testDisplayPlayerTwoLostMessageWhenPlayerTwoTimerIsZerop() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.displayPlayerTwoTimer(playerTwoTimer: 0)
        
        let expected = "Player Two Lost"
        XCTAssertEqual(view.title,expected)
    }
}
