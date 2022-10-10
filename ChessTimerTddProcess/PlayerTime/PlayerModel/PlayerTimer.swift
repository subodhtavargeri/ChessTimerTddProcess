import Foundation

struct PlayerTimer {
    var timer: Timer?
    var presneter: Game
    
    init(game: Game) {
        self.presneter = game
        timer = Timer.scheduledTimer(withTimeInterval: 2.0,
                                                 repeats: true) {_ in
            game.updatePlayerOneTimer()
            
        }
       // timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(testData), userInfo: nil, repeats: true)
    }
    
    func testData() {
       
    }
    mutating func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
