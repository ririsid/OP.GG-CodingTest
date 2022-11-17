//
//  ContentView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {

    let summonerService: SummonerService = .init()

    @State private var apiError: APIError? = nil
    @State private var showAlert = false
    @State private var summoner: Summoner? = nil
    @State private var matches: SummonerMatches? = nil

    // MARK: Views

    var body: some View {
        VStack {
            if let summoner = summoner {
                HeaderView(summoner: SummonerModel(summoner))
            }
        }
        .alert(isPresented: $showAlert, error: apiError) { _ in
            Button("OK") {}
        } message: { error in
            if let recoverySuggestion = error.recoverySuggestion {
                Text(recoverySuggestion)
            }
        }
        .task(task)
    }

    // MARK: Methods

    @Sendable private func task() async {
        do {
            summoner = try await summonerService.fetchSummoner("genetory")
            matches = try await summonerService.fetchSummonerMatches("genetory")
        } catch {
            if let error = error as? APIError {
                showAlert = true
                apiError = error
                if let requestURL = error.response?.request?.url {
                    Logger.network.notice("\(error.localizedDescription) (\(requestURL))")
                }
            } else {
                Logger.network.notice("\(error.localizedDescription)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
