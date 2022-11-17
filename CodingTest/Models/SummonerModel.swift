//
//  SummonerModel.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import Foundation

struct SummonerModel {

    let name: String
    let level: Int
    let profileImageURL: URL
    let leagues: [League]
}

extension SummonerModel {

    struct League: Identifiable {

        let id = UUID()
        let wins: Int
        let losses: Int
        let tierName: String
        let tier: String
        let tierImageURL: URL
        let lp: Int

        /// 승률 (Double)
        ///
        /// (승리한 경기 수) ÷ {(승수)+(패수)}
        var winningPercentage: Double {
            Double(wins) / Double(wins + losses)
        }

        /// 승률 (String)
        var winningPercentageString: String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber(value: winningPercentage)) ?? ""
        }
    }
}

extension SummonerModel {

    init(_ summoner: Summoner) {
        self.name = summoner.name
        self.level = summoner.level
        self.profileImageURL = summoner.profileImageURL
        self.leagues = summoner.leagues.map(SummonerModel.League.init)
    }
}

extension SummonerModel.League {

    init(_ league: League) {
        self.wins = league.wins
        self.losses = league.losses
        self.tierName = league.tierRank.name
        self.tier = league.tierRank.tier
        self.tierImageURL = league.tierRank.imageURL
        self.lp = league.tierRank.lp
    }
}
