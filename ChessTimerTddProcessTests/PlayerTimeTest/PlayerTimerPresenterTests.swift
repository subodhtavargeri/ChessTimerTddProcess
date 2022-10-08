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

}
