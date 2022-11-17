// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genetory = try? newJSONDecoder().decode(Genetory.self, from: jsonData)

import Foundation

// MARK: - SummonerData
struct SummonerData: Codable {
    let summoner: Summoner
}

// MARK: - Summoner
struct Summoner: Codable {
    let name: String
    let level: Int
    let profileImageURL: URL
    let profileBorderImageURL: URL
    let url: URL
    let leagues: [League]
    let previousTiers: [PreviousTier]
    let ladderRank: LadderRank
    let profileBackgroundImageURL: String

    enum CodingKeys: String, CodingKey {
        case name, level
        case profileImageURL = "profileImageUrl"
        case profileBorderImageURL = "profileBorderImageUrl"
        case url, leagues, previousTiers, ladderRank
        case profileBackgroundImageURL = "profileBackgroundImageUrl"
    }
}

// MARK: - LadderRank
struct LadderRank: Codable {
    let rank, rankPercentOfTop: Int
}

// MARK: - League
struct League: Codable {
    let hasResults: Bool
    let wins, losses: Int
    let tierRank: PreviousTier
}

// MARK: - PreviousTier
struct PreviousTier: Codable {
    let name, tier, tierDivision, string: String
    let shortString, division: String
    let imageURL: String
    let lp, tierRankPoint: Int
    let season: Int?

    enum CodingKeys: String, CodingKey {
        case name, tier, tierDivision, string, shortString, division
        case imageURL = "imageUrl"
        case lp, tierRankPoint, season
    }
}
