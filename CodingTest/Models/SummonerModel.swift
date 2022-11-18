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

    /// 승률
    var winningPercentage: String {
        Calculator.winningPercentage(wins: wins, losses: losses)
    }
}
