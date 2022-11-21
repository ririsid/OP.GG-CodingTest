//
//  MatchesModel.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/18.
//

import Foundation

struct MatchesModel {

    let wins: Int
    let losses: Int
    let kills: Int
    let deaths: Int
    let assists: Int
    let champions: [Champion]
    let position: Position?
    let games: [Game]

    /// 게임수
    var numberOfGames: Int {
        wins + losses
    }
}

extension MatchesModel {

    struct Champion: Identifiable {

        let id: Int
        let imageURL: URL
        let wins: Int
        let losses: Int

        /// 승률
        var winningPercentage: String {
            Calculator.winningPercentage(wins: wins, losses: losses)
        }
    }
}

extension MatchesModel {

    struct Position: Identifiable {

        var id: String { abbreviation }
        let abbreviation: String
        let wins: Int
        let losses: Int

        /// 승률
        var winningPercentage: String {
            Calculator.winningPercentage(wins: wins, losses: losses)
        }
    }
}

extension MatchesModel {

    struct Game: Identifiable {

        var id: String { gameId }
        let gameId: String
        let isWin: Bool
        let gameLength: UInt
        let gameType: String
        let createDate: UInt
        let kills: Int
        let deaths: Int
        let assists: Int
        let killParticipation: String
        let championImageURL: URL
        let badge: OpScoreBadge
        let spellImageURLs: [URL]
        let runeImageURLs: [URL]
        let itemImageURLs: [URL]
        let wardImageURL: URL?

        /// 게임 시간
        var gameTime: String {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = gameLength >= 3600 ? [.hour, .minute, .second] : [.minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            return formatter.string(from: TimeInterval(gameLength)) ?? ""
        }

        /// 생성일
        var createdAt: Date {
            Date(timeIntervalSince1970: TimeInterval(createDate))
        }

        /// 지난 시간
        var timeAgo: String {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            return formatter.localizedString(for: createdAt, relativeTo: Date())
        }
    }
}

extension MatchesModel {

    init(_ matches: SummonerMatches) {
        self.wins = matches.summary.wins
        self.losses = matches.summary.losses
        self.kills = matches.summary.kills
        self.deaths = matches.summary.deaths
        self.assists = matches.summary.assists
        self.champions = matches.champions.map(Champion.init)
        if let position = matches.positions.first {
            self.position = Position(position)
        } else {
            self.position = nil
        }
        self.games = matches.games.map(Game.init)
    }
}

extension MatchesModel.Champion {

    init(_ champion: ChampionElement) {
        self.id = champion.id
        self.imageURL = champion.imageURL
        self.wins = champion.wins
        self.losses = champion.losses
    }
}

extension MatchesModel.Position {

    init(_ position: Position) {
        self.abbreviation = position.position
        self.wins = position.wins
        self.losses = position.losses
    }
}

extension MatchesModel.Game {

    init(_ game: Game) {
        self.gameId = game.gameID
        self.isWin = game.isWin
        self.gameLength = game.gameLength
        self.gameType = game.gameType
        self.createDate = game.createDate
        self.kills = game.stats.general.kill
        self.deaths = game.stats.general.death
        self.assists = game.stats.general.assist
        self.killParticipation = game.stats.general.contributionForKillRate
        self.championImageURL = game.champion.imageURL
        self.badge = game.stats.general.opScoreBadge
        self.spellImageURLs = game.spells.map({ $0.imageURL })
        self.runeImageURLs = game.peak
        self.itemImageURLs = game.items.dropLast().map({ $0.imageURL })
        self.wardImageURL = game.items.last?.imageURL
    }
}
