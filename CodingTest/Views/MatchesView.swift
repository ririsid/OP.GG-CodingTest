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
            ForEach(matches.games) { game in
                GameRow(game: game)
            }
        }
    }

    @ViewBuilder func resultView(isWin: Bool, gameTime: String) -> some View {
        VStack(spacing: 6) {
            Spacer()
            Text(result(isWin: isWin))
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            Divider()
                .frame(width: 16, height: 1)
                .overlay(.white.opacity(0.4))
            Text(gameTime)
                .font(.textStyle5)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 40)
        .background(resultBackgroundColor(isWin: isWin))
    }

    @ViewBuilder func resultBackgroundColor(isWin: Bool) -> some View {
        if isWin {
            Color.softBlue
        } else {
            Color.darkishPink
        }
    }

    @ViewBuilder func badgeIcon(_ badge: OpScoreBadge) -> some View {
        if badge == .none {
            Color.clear
                .frame(width: 29, height: 16)
        } else {
            Text(badge.rawValue)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 29, height: 16)
                .background(badgeBackgroundColor(badge))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.white, lineWidth: 1)
                )
        }
    }

    @ViewBuilder func badgeBackgroundColor(_ badge: OpScoreBadge) -> some View {
        switch badge {
        case .ace:
            Color.periwinkle
        case .mvp:
            Color.orangeYellow
        case .none:
            Color.clear
        }
    }

    @ViewBuilder func kdaText(kills: Int, deaths: Int, assists: Int) -> some View {
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
        }
        .font(.system(size: 16))
        .foregroundColor(.darkGrey)
    }

    @ViewBuilder func killParticipationText(_ killParticipation: String) -> some View {
        Text("K/P \(killParticipation)")
            .font(.textStyle)
            .foregroundColor(.gunmetal)
    }

    // MARK: Methods

    private func result(isWin: Bool) -> LocalizedStringKey {
        return isWin ? "W" : "L"
    }
}

struct MatchesView_Previews: PreviewProvider {

    static var previews: some View {
        MatchesView(matches: .init(wins: 15, losses: 5, kills: 25, deaths: 27, assists: 35, champions: [.init(id: 90, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png?image=w_30&v=1")!, wins: 11, losses: 4), .init(id: 4, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/TwistedFate.png?image=w_30&v=1")!, wins: 2, losses: 1)], position: .init(abbreviation: "JNG", wins: 15, losses: 5), games: [.init(gameId: "98745871", isWin: true, gameLength: 1225, gameType: "일반", createDate: 1668574248, kills: 2, deaths: 10, assists: 4, killParticipation: "19%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Tristana.png")!, badge: .none, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/3198.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3113.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!]), .init(gameId: "32190628", isWin: true, gameLength: 3073, gameType: "솔랭", createDate: 1668571606, kills: 5, deaths: 1, assists: 3, killParticipation: "56%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Galio.png")!, badge: .ace, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/3020.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1026.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!]), .init(gameId: "371807637", isWin: false, gameLength: 1431, gameType: "무작위 총력전", createDate: 1668568946, kills: 5, deaths: 8, assists: 2, killParticipation: "30%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png")!, badge: .mvp, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/1026.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3020.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!])]))
    }
}
