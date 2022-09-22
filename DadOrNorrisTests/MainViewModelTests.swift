//
//  MainViewModelTests.swift
//  DadOrNorrisTests
//
//  Created by Maciej Mejer on 22/09/2022.
//

import XCTest
@testable import DadOrNorris

@MainActor final class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModel!
    var fetcher: MockFetcher!

   @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        self.fetcher = MockFetcher(mockedResult: .success(Data()))
        self.viewModel = MainViewModel(fetcher: fetcher)
    }
                                   
    func testPositiveDataFetch() async throws {
        self.fetcher.mockedResult = .success(Data(base64Encoded: MockFetcher.MockResponses.validDadJoke.rawValue) ?? Data())
        await viewModel.fetchData(choice: .dadJoke)
        assert(viewModel.currentState == .recieved(.success("I wouldn't buy anything with velcro. It's a total rip-off.")))
    }
    
    func testNegativeDataFetch() async throws {
        self.fetcher.mockedResult = .failure(FetcherErrors.statusCodeNotSuccess)
        await viewModel.fetchData(choice: .chuckNorrisFact)
        assert(viewModel.currentState == .recieved(.failure(FetcherErrors.statusCodeNotSuccess)))
    }
    
    func testResetingStatus() async throws {
        try await testPositiveDataFetch()
        viewModel.resetState()
        assert(viewModel.currentState == .waitingForChoice)
    }

    @MainActor override func tearDownWithError() throws {
            self.fetcher = nil
            self.viewModel = nil
            try super.tearDownWithError()
    }


}

