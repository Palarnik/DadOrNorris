//
//  Fetcher.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

protocol Fetcher {
    func fetch(for request: UserRequest) async -> Result<Data, Error>
}
