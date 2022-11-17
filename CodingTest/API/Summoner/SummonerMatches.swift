// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let summonerMatches = try? newJSONDecoder().decode(SummonerMatches.self, from: jsonData)

import Foundation

// MARK: - SummonerMatches
struct SummonerMatches: Codable {
    let games: [Game]
    let champions: [ChampionElement]
    let positions: [Position]
    let summary: Summary
}

// MARK: - ChampionElement
struct ChampionElement: Codable, Identifiable {
    let id: Int
    let key, name: String
    let imageURL: String
    let games, kills, deaths, assists: Int
    let wins, losses: Int

    enum CodingKeys: String, CodingKey {
        case id, key, name
        case imageURL = "imageUrl"
        case games, kills, deaths, assists, wins, losses
    }
}

// MARK: - Game
struct Game: Codable, Identifiable {
    var id: String { gameID }

    let mmr: Int?
    let champion: GameChampion
    let spells, items: [Item]
    let needRenew: Bool
    let gameID: String
    let createDate, gameLength: Int
    let gameType: GameType
    let summonerID: String
    let summonerName: SummonerName
    let tierRankShort: TierRankShort
    let stats: Stats
    let peak: [String]
    let isWin: Bool

    enum CodingKeys: String, CodingKey {
        case mmr, champion, spells, items, needRenew
        case gameID = "gameId"
        case createDate, gameLength, gameType
        case summonerID = "summonerId"
        case summonerName, tierRankShort, stats, peak, isWin
    }
}

// MARK: - GameChampion
struct GameChampion: Codable {
    let imageURL: String
    let level: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case level
    }
}

enum GameType: String, Codable {
    case 무작위총력전 = "무작위 총력전"
    case 솔랭 = "솔랭"
    case 일반 = "일반"
    case 자유55랭크 = "자유 5:5 랭크"
}

// MARK: - Item
struct Item: Codable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }
}

// MARK: - Stats
struct Stats: Codable {
    let general: General
    let ward: Ward
}

// MARK: - General
struct General: Codable {
    let kill, death, assist: Int
    let kdaString: String
    let cs: Int
    let csPerMin: Double
    let contributionForKillRate: String
    let goldEarned, totalDamageDealtToChampions: Int
    let largestMultiKillString: LargestMultiKillString
    let opScoreBadge: OpScoreBadge
}

enum LargestMultiKillString: String, Codable {
    case doubleKill = "Double Kill"
    case empty = ""
}

enum OpScoreBadge: String, Codable {
    case ace = "ACE"
    case empty = ""
}

// MARK: - Ward
struct Ward: Codable {
    let sightWardsBought, visionWardsBought: Int
}

enum SummonerName: String, Codable {
    case genetory = "genetory"
}

enum TierRankShort: String, Codable {
    case c1 = "C1"
}

// MARK: - Position
struct Position: Codable {
    let games, wins, losses: Int
    let position, positionName: String
}

// MARK: - Summary
struct Summary: Codable {
    let wins, losses, kills, deaths: Int
    let assists: Int
}
