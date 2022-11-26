//
//  LeaguesView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/26.
//

import SwiftUI

struct LeaguesView: View {

    let leagues: [SummonerModel.League]

    // MARK: Views

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Spacer()
                        .frame(width: 8)

                    ForEach(leagues) { league in
                        LeagueRow(league: league, width: max(0, (proxy.size.width - 48)))
                    }

                    Spacer()
                        .frame(width: 8)
                }
            }
        }
        .frame(height: 100)
        .padding(.vertical, 8)
    }
}

struct LeaguesView_Previews: PreviewProvider {

    static var previews: some View {
        LeaguesView(leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), .init(wins: 879, losses: 896, tierName: "자유 5:5 랭크", tier: "Grandmaster", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/grandmaster_1.png")!, lp: 485)])
    }
}
