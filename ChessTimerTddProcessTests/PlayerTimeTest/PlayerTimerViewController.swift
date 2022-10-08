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
    
}