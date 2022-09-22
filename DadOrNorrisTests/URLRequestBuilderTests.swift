//
//  URLRequestBuilderTests.swift
//  DadOrNorrisTests
//
//  Created by Maciej Mejer on 22/09/2022.
//

import XCTest
@testable import DadOrNorris

final class URLRequestBuilderTests: XCTestCase {
    func testBuilderForChuckNorrisFact() throws {
        let request = try URLRequestBuilder.build(for: .chuckNorrisFact)
        assert(request.url?.absoluteString == URLRequestBuilder.Endpoints.chuckNorris.rawValue)
    }
    
    func testBuilderForDadJoke() throws {
        let request = try URLRequestBuilder.build(for: .dadJoke)
        assert(request.url?.absoluteString == URLRequestBuilder.Endpoints.icanhazdadjoke.rawValue && request.allHTTPHeaderFields?["Accept"] == "application/json")
    }
}
