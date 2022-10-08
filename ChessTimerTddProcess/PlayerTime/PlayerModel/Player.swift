import Foundation

enum PlayerStatus {
    case start, stop, pause
}
struct Player: Equatable {
    let playerId: Int
    var state: PlayerStatus
    var totalTime: Int
    var timeLeft: Int {
        mutating get {
            totalTime -= 1
            return totalTime
        }
    }
}
