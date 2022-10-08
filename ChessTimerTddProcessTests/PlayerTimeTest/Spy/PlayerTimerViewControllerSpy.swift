import Foundation
@testable import ChessTimerTddProcess

class PlayerTimerViewControllerSpy: PlayerTimerViewProtocol {
    
    var title: String?
    
    func setTitle(title: String) {
        self.title = title
    }
}
