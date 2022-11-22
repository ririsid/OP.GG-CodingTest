//
//  SummonerReducer.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/22.
//

import ComposableArchitecture

struct SummonerReducer: ReducerProtocol {

    struct State: Equatable {
        var summoner: SummonerModel?
    }

    enum Action: Equatable {
        case updateButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .updateButtonTapped:
            return .none
        }
    }
}
