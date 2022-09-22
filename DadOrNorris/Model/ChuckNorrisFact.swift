//
//  ChuckNorrisFact.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

struct ChuckNorrisFact: UserRequestable, Codable {
    let icon_url: String
    let id: String
    let url: String
    let value: String
    
    var textToPresent: String { return value }
}
