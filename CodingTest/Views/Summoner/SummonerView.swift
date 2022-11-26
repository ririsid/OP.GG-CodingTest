//
//  SummonerView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

import ComposableArchitecture

struct SummonerView: View {

    let store: StoreOf<SummonerReducer>

    // MARK: Views

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProfileView(store: store)

            IfLetStore(store.scope(state: \.summoner)) { store in
                WithViewStore(store) { viewStore in
                    LeaguesView(leagues: viewStore.leagues)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct HeaderView_Previews: PreviewProvider {

    static var previews: some View {
        SummonerView(store: .init(
            initialState: .init(summoner: .init(name: "genetory", level: 44, profileImageURL: URL(string: "https://opgg-static.akamaized.net/images/profile_icons/profileIcon1625.jpg")!, leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), .init(wins: 879, losses: 896, tierName: "자유 5:5 랭크", tier: "Grandmaster", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/grandmaster_1.png")!, lp: 485)])),
            reducer: SummonerReducer()
        ))
        .background(.paleGrey)
    }
}
