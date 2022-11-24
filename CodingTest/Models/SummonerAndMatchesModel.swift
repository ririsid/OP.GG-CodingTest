//
//  SummonerAndMatchesModel.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/22.
//

import Foundation

struct SummonerAndMatchesModel: Equatable {

    let summoner: SummonerModel
    let matches: MatchesModel

    init(_ values: (Summoner, SummonerMatches)) {
        self.summoner = .init(values.0)
        self.matches = .init(values.1)
    }
}
