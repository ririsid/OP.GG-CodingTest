//
//  ContentView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {

    let summonerName: String = "genetory"

    let summonerService: SummonerService = .init()

    @State private var apiError: APIError? = nil
    @State private var showAlert = false
    @State private var summoner: SummonerModel? = nil
    @State private var matches: MatchesModel? = nil

    // MARK: Views

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                if let summoner {
                    HeaderView(summoner: summoner)
                }
                if let matches {
                    MatchesView(matches: matches)
                }
            }
        }
        .background(.paleGrey)
        .alert(isPresented: $showAlert, error: apiError) { _ in
            Button("OK") {}
        } message: { error in
            if let recoverySuggestion = error.recoverySuggestion {
                Text(recoverySuggestion)
            }
        }
        .task(loadData)
        .refreshable(action: loadData)
    }

    // MARK: Methods

    @Sendable private func loadData() async {
        do {
            summoner = SummonerModel(try await summonerService.fetchSummoner(summonerName))
            matches = MatchesModel(try await summonerService.fetchSummonerMatches(summonerName))
        } catch {
            if let error = error as? APIError {
                apiError = error
                showAlert = true
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
