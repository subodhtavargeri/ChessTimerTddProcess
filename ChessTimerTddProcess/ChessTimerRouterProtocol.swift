import Foundation
import UIKit

class Router: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToPlayerTimer() {
        let playerTimerController = PlayerTimerFactory.create(router: self)
        navigationController.pushViewController(playerTimerController, animated: true)
    }
}
