//
//  MatchesView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/18.
//

import SwiftUI

struct MatchesView: View {

    let matches: MatchesModel

    // MARK: Views

    var body: some View {
        LazyVStack(spacing: 0) {
            summaryRow
            ForEach(matches.games) { game in
                GameRow(game: game)
            }
        }
    }

    var summaryRow: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Summary last \(matches.numberOfGames) games")
                Spacer()
                VStack(alignment: .leading, spacing: 2) {
                    Text(makeWinLoseString(matches.wins, matches.losses))
                    kdaText(matches.kills, matches.deaths, matches.assists)
                    Text(matches.kdaRatio)
                        .foregroundColor(.greenBlue)
                }
            }
            .frame(maxWidth: .infinity)
            VStack(spacing: 0) {
                Text("Most Win")
                Spacer()
                HStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 16) {
                        ForEach(matches.champions.prefix(2)) { champion in
                            VStack(spacing: 4) {
                                AsyncImage(url: champion.imageURL) {
                                    $0.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)

                                Text(champion.winningPercentageString)
                                    .foregroundColor(winningPercentageColor(champion.winningPercentage))
                            }
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: 98)
            VStack(spacing: 0) {
                Text("Position")
                Spacer()
                if let position = matches.position {
                    VStack(spacing: 4) {
                        Image(positionIconName(position.abbreviation))
                            .resizable()
                            .frame(width: 24, height: 24)
                            .frame(width: 30, height: 30)

                        Text(position.winningPercentageString)
                            .foregroundColor(winningPercentageColor(position.winningPercentage))
                    }
                }
            }
            .frame(width: 64)
        }
        .font(.system(size: 10))
        .foregroundColor(.coolGrey)
        .padding(12)
        .frame(height: 90)
    }

    @ViewBuilder private func kdaText(_ kills: Int, _ deaths: Int, _ assists: Int) -> some View {
        HStack(spacing: 0) {
            Text("\(kills)")
                .bold()
            Text(" / ")
            Text("\(deaths)")
                .bold()
                .foregroundColor(.darkishPink)
            Text(" / ")
            Text("\(assists)")
                .bold()
            Spacer()
        }
        .font(.system(size: 14))
        .foregroundColor(.darkGrey)
        .lineLimit(1)
        .frame(maxWidth: .infinity)
    }

    // MARK: Methods

    private func makeWinLoseString(_ wins: Int, _ losses: Int) -> LocalizedStringKey {
        return "\(wins)W \(losses)L"
    }

    private func winningPercentageColor(_ winningPercentage: Double) -> Color {
        return winningPercentage == 1 ? .darkishPink : .darkGrey
    }

    private func positionIconName(_ position: String) -> String {
        return "iconLol\(position.capitalized)"
    }
}

struct MatchesView_Previews: PreviewProvider {

    static var previews: some View {
        MatchesView(matches: .init(wins: 15, losses: 5, kills: 25, deaths: 27, assists: 35, champions: [.init(id: 90, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png?image=w_30&v=1")!, wins: 11, losses: 4), .init(id: 4, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/TwistedFate.png?image=w_30&v=1")!, wins: 2, losses: 1)], position: .init(abbreviation: "JNG", wins: 15, losses: 5), games: [.init(gameId: "98745871", isWin: true, gameLength: 1225, gameType: "일반", createDate: 1668574248, kills: 2, deaths: 10, assists: 4, killParticipation: "19%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Tristana.png")!, badge: .none, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/3198.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3113.png")!], wardImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!), .init(gameId: "32190628", isWin: true, gameLength: 3073, gameType: "솔랭", createDate: 1668571606, kills: 5, deaths: 1, assists: 3, killParticipation: "56%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Galio.png")!, badge: .ace, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/3020.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1026.png")!], wardImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!), .init(gameId: "371807637", isWin: false, gameLength: 1431, gameType: "무작위 총력전", createDate: 1668568946, kills: 5, deaths: 8, assists: 2, killParticipation: "30%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png")!, badge: .mvp, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/1026.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3020.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!], wardImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!)]))
    }
}
