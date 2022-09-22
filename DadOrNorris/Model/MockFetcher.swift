//
//  MockFetcher.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

class MockFetcher: Fetcher {
    var mockedResult: Result<Data, Error>
    
    init(mockedResult: Result<Data, Error>) {
        self.mockedResult = mockedResult
    }
    
    func fetch(for request: UserRequest) async -> Result<Data, Error> {
        return mockedResult
    }
    
    enum MockResponses: String {
        case validDadJoke = "eyJpZCI6Im9PUjdoRmR4NUVkIiwiam9rZSI6Ikkgd291bGRuJ3QgYnV5IGFueXRoaW5nIHdpdGggdmVsY3JvLiBJdCdzIGEgdG90YWwgcmlwLW9mZi4iLCJzdGF0dXMiOjIwMH0K"
        case validChuckNorrisFact = "eyJjYXRlZ29yaWVzIjpbXSwiY3JlYXRlZF9hdCI6IjIwMjAtMDEtMDUgMTM6NDI6MjAuNTY4ODU5IiwiaWNvbl91cmwiOiJodHRwczovL2Fzc2V0cy5jaHVja25vcnJpcy5ob3N0L2ltZy9hdmF0YXIvY2h1Y2stbm9ycmlzLnBuZyIsImlkIjoidDFrRTg2bWNRMVNCRkVBZDBEVTdmdyIsInVwZGF0ZWRfYXQiOiIyMDIwLTAxLTA1IDEzOjQyOjIwLjU2ODg1OSIsInVybCI6Imh0dHBzOi8vYXBpLmNodWNrbm9ycmlzLmlvL2pva2VzL3Qxa0U4Nm1jUTFTQkZFQWQwRFU3ZnciLCJ2YWx1ZSI6IkNodWNrIE5vcnJpcyBmaXhlcyB0aGUgc3VzcGVuc2lvbiBvbiBoaXMgSHVtbWVyIHdoZW4gaGUgbGltYm8gZGFuY2VzIHVuZGVyIGl0In0="
        case random = "RTg2bWNRMVNCRkVBZDBEVTdmdyIsInVwZGF0ZWRfYXQiOiIyMDIwLTAxLTA1IDEzOjQyOjIwLjU2ODg1OSIsInVybCI6Im"
        case empty = ""
    }
}
