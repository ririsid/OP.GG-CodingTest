//
//  AppReducer.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/21.
//

import ComposableArchitecture

struct AppReducer: ReducerProtocol {

    let summonerService: SummonerService = .init()

    struct State: Equatable {
        var name: String?
        var apiError: APIError?
        var showAlert: Bool = false
        var summoner: SummonerReducer.State?
        var matches: MatchesReducer.State?
    }

    enum Action: Equatable {
        case onAppear(name: String)
        case dataLoaded(TaskResult<SummonerAndMatchesModel>)
        case apiErrorAlertDismissed
        case summoner(SummonerReducer.Action)
        case matches(MatchesReducer.Action)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear(let name):
            state.name = name
            return .task {
                await .dataLoaded(
                    TaskResult {
                        SummonerAndMatchesModel(try await summonerService.fetchSummonerAndMatches(name))
                    }
                )
            }
        case let .dataLoaded(.success(data)):
            state.summoner = .init(summoner: data.summoner)
            state.matches = .init(matches: data.matches)
            return .none
        case let .dataLoaded(.failure(error)):
            state.apiError = error as? APIError
            state.showAlert = true
            return .none
        case .apiErrorAlertDismissed:
            state.apiError = nil
            state.showAlert = false
            return .none
        case .summoner(.updateButtonTapped):
            return .task { [name = state.name!] in
                await .dataLoaded(
                    TaskResult {
                        SummonerAndMatchesModel(try await summonerService.fetchSummonerAndMatches(name))
                    }
                )
            }
        case .matches(.lastItemPresented):
            return .none
        }
    }
}
