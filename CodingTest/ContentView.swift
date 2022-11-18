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
        ScrollView {
            LazyVStack {
                if let summoner = summoner {
                    HeaderView(summoner: SummonerModel(summoner))
                }
            }
        }
        .background(Color.paleGrey)
        .alert(isPresented: $showAlert, error: apiError) { _ in
            Button("OK") {}
        } message: { error in
            if let recoverySuggestion = error.recoverySuggestion {
                Text(recoverySuggestion)
            }
        }
        .task(fetchData)
        .refreshable(action: fetchData)
    }

    // MARK: Methods

    @Sendable private func fetchData() async {
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
