//
//  ContentView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import SwiftUI

import ComposableArchitecture

struct ContentView: View {

    let store: StoreOf<AppReducer>
    let summonerName: String = "genetory"

    @State private var showAlert: Bool = false

    // MARK: Views

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                if !viewStore.isLoading {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            IfLetStore(store.scope(state: \.summoner, action: AppReducer.Action.summoner)) {
                                HeaderView(store: $0)
                            }
                            IfLetStore(store.scope(state: \.matches, action: AppReducer.Action.matches)) {
                                MatchesView(store: $0)
                            }
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .background(.paleGrey)
            .alert(isPresented: viewStore.binding(get: \.showAlert, send: .apiErrorAlertDismissed),
                   error: viewStore.apiError) { _ in
                Button("OK") {}
            } message: { error in
                if let recoverySuggestion = error.recoverySuggestion {
                    Text(recoverySuggestion)
                }
            }
            .task {
                await viewStore.send(.onAppear(name: summonerName)).finish()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(store: .init(
            initialState: AppReducer.State(),
            reducer: AppReducer()
        ))
    }
}
