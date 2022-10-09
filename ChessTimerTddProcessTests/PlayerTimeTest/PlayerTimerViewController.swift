import Foundation
@testable import ChessTimerTddProcess
import XCTest

class PlayerTimerViewControllerTests: XCTestCase {
    
    let sut = PlayerTimerViewController()
    let presenter = PlayerTimerPresenterSpy()
    
    override func setUp(){
        _ = sut.view
        sut.setup(presenter: presenter)
    }
    
    func testViewTitle() {
        sut.setTitle(title: "Player Timer")
        
        let expecation = "Player Timer"
        XCTAssertEqual(sut.title, expecation)
    }
    
    func testPlayerOneTimerLabelIsDisplayed() {
        sut.setPlayerOneLabelTimer(timer: "2")
        
        let expecation = "2"
        XCTAssertEqual(sut.labelPlayerOneTimer.text, expecation)
    }
    
    func testWhenSettingViewIsClicked() {
        sut.buttonGameSettingClicked((Any).self)
        
        let expectation = 20
        XCTAssertEqual(presenter.timer, expectation)
    }
    
    func testPlayerTwoTimerLabelIsDisplayed() {
        sut.setPlayerTwoLabelTimer(timer: "2")
        
        let expecation = "2"
        XCTAssertEqual(sut.labelPlayerTwoTimer.text, expecation)
    }
}
