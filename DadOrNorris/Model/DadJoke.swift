//
//  DadJoke.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

struct DadJoke: UserRequestable, Codable {
    let id: String
    let joke: String
    let status: Int
    
    var textToPresent: String { return joke }
}
