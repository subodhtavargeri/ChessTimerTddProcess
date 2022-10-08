import Foundation

struct  PlayerTimerFactory {
    static func create(router: RouterProtocol) -> PlayerTimerViewController {
        let game = Game()
        let view = PlayerTimerViewController()
        let presenter = PlayerTimerPresenter.init(controller: view, game: game)
        view.setup(presenter: presenter)
        game.setup(presenter: presenter)
        return view
    }
}
