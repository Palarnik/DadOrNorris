//
//  NetworkFetcher.swift
//  DadOrNorris
//
//  Created by Maciej Mejer on 22/09/2022.
//

import Foundation

struct NetworkFetcher: Fetcher {
    func fetch(for request: UserRequest) async -> Result<Data, Error> {
        do {
            let urlRequest = try URLRequestBuilder.build(for: request)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(FetcherErrors.statusCodeNotSuccess)
            }
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
