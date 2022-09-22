//
//  ContentView.swift
//  TickTackCrypto
//
//  Created by Maciej Mejer on 18/09/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        switch viewModel.currentState {
            case .waitingForChoice:
                VStack {
                    ZStack {
                        Color.indigo.ignoresSafeArea()
                        Text("Tell me a dad joke 👨🏻").font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(16)
                    }.onTapGesture {
                        viewModel.onUserRequest(choice: .dadJoke)
                    }
                    ZStack {
                        Color.green.ignoresSafeArea()
                        Text("Tell me a Chuck Norris fact 🧔‍♂️").font(.largeTitle).multilineTextAlignment(.center)
                            .padding(16)
                    }.onTapGesture {
                        viewModel.onUserRequest(choice: .chuckNorrisFact)
                    }
                }
            case .recieved(let result):
                switch result {
                    case .success(let string):
                        ZStack {
                            Color.teal.ignoresSafeArea()
                            VStack {
                                Text(string)
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.center)
                                    .padding(16.0)
                                
                                Text("Tap anywhere to ask me again")
                            }
                        }.onTapGesture {
                            viewModel.resetState()
                        }
                    case .failure:
                        ZStack {
                            Color.red.ignoresSafeArea()
                            VStack {
                                Text("Well nothing comes to my mind at this moment... Tap anywhere to try asking me again").font(.subheadline).multilineTextAlignment(.center).padding(16.0)
                            }
                        }.onTapGesture {
                            viewModel.resetState()
                        }
                }
            default:
                ZStack {
                    Color.mint.ignoresSafeArea()
                    ProgressView()
                    Text("Hmmm... let me think")
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       MainView(viewModel: MainViewModel(fetcher: MockFetcher(mockedResult: .success( Data(base64Encoded: MockFetcher.MockResponses.validDadJoke.rawValue) ?? Data()))))
    }
}

