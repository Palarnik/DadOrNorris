//
//  URLRequestBuilder.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

enum URLRequestBuilder {
    static func build(for request: UserRequest) throws -> URLRequest {
        switch request {
            case .dadJoke:
                guard let url = URL(string: Endpoints.icanhazdadjoke.rawValue) else { throw URLRequestBuilderErrors.cantParseStringToUrl }
                var request = URLRequest(url: url)
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                return request
            case .chuckNorrisFact:
                guard let url = URL(string: Endpoints.chuckNorris.rawValue) else { throw URLRequestBuilderErrors.cantParseStringToUrl }
                
                return URLRequest(url: url)
        }
    }
    
    enum Endpoints: String {
        case icanhazdadjoke = "https://icanhazdadjoke.com/"
        case chuckNorris = "https://api.chucknorris.io/jokes/random"
    }
    

}
