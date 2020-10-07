//
//  Sign.swift
//  RPS
//
//  Created by Никита Полыко on 10/2/20.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign () -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .scissors
    } else {
        return .paper
    }
}


enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
            
        }
    }
    
    func getResult(for oposite : Sign) -> GameState {
        switch self {
        case .paper:
            switch oposite {
            case .paper:
                return .draw
            case .rock:
                return .win
            case .scissors:
                return .lose
            }
        case .rock:
            switch oposite {
            case .rock:
                return .draw
            case .scissors:
                return .win
            case .paper:
                return .lose
            }
        case .scissors:
            switch oposite {
            case .scissors:
                return .draw
            case .paper:
                return .win
            case .rock:
                return .lose
                
            }
        }
    }
}

