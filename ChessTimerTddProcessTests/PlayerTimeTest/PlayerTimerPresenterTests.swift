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
        
        presenter.startGame(gameTime: 2)
        
        let expected = 2
        XCTAssertEqual(game.time,expected)
    }
    
    func testDisplayPlayerOneTimer() {
        let view = PlayerTimerViewControllerSpy()
        let game = GameSpy()
        let presenter = PlayerTimerPresenter(controller: view, game: game)
        
        presenter.displayPlayerOneTimer(playerOneTimer: 2)
        
        let expected = "2"
        XCTAssertEqual(view.title,expected)
    }
 
}
