//
//  MainViewModel.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Combine
import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var currentState = MainViewModelStates.waitingForChoice
    private var fetcher: Fetcher!
    
    init(fetcher: Fetcher) {
        self.fetcher = fetcher
    }
    
    func resetState() {
        currentState = .waitingForChoice
    }
    
    func onUserRequest(choice: UserRequest)  {
        currentState = .fetching
        Task {
            await fetchData(choice: choice)
        }
    }
    
    func fetchData(choice: UserRequest) async {
        let result = await fetcher.fetch(for: choice)
        switch result {
            case .success(let data):
                do {
                    var requestedObject: UserRequestable!
                    switch choice {
                        case .chuckNorrisFact:
                            requestedObject = try JSONDecoder().decode(ChuckNorrisFact.self, from: data)
                        case .dadJoke:
                            requestedObject = try JSONDecoder().decode(DadJoke.self, from: data)
                    }
                    currentState = .recieved(.success(requestedObject.textToPresent))
                } catch {
                    currentState = .recieved(.failure(error))
                }
            case .failure(let error):
                currentState = .recieved(.failure(error))
        }
    }
}
