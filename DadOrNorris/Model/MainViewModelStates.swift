//
//  MainViewModelStates.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

enum MainViewModelStates: Equatable {
    static func == (lhs: MainViewModelStates, rhs: MainViewModelStates) -> Bool {
        switch (lhs, rhs) {
            case (.waitingForChoice, .waitingForChoice), (.fetching, .fetching):
                return true
            case (.recieved(let a), .recieved(let b)):
                switch (a, b) {
                    case (.failure(_), .failure(_)):
                        return true
                    case (.success(let successA), .success(let successB)):
                        return successA == successB
                    default:
                        return false
                }
            default:
                return false
        }
        
    }
    
    case waitingForChoice
    case fetching
    case recieved(Result<String, Error>)
    
    
}
