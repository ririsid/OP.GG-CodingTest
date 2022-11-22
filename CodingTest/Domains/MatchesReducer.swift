//
//  MatchesReducer.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/22.
//

import ComposableArchitecture

struct MatchesReducer: ReducerProtocol {

    struct State: Equatable {
        var matches: MatchesModel?
    }

    enum Action: Equatable {
        case lastItemPresented
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .lastItemPresented:
            return .none
        }
    }
}
