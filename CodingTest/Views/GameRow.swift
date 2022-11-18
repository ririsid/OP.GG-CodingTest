//
//  GameRow.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/19.
//

import SwiftUI

struct GameRow: View {

    let game: MatchesModel.Game

    // MARK: Views

    var body: some View {
        HStack(spacing: 0) {
            resultView
            VStack(spacing: 0) {
                gameInfoView
                Spacer()
                itemList
            }
            .padding(16)
        }
        .frame(height: 104)
        .background(.white)
        .shadow(color: .clear, radius: 0)
        .shadow(color: .steelGrey.opacity(0.1), radius: 2, y: 4)
        .padding(.bottom, 4)
    }

    var resultView: some View {
        VStack(spacing: 6) {
            Spacer()
            Text(result(isWin: game.isWin))
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            Divider()
                .frame(width: 16, height: 1)
                .overlay(.white.opacity(0.4))
            Text(game.gameTime)
                .font(.textStyle5)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 40)
        .background(resultBackgroundColor(isWin: game.isWin))
    }

    var gameInfoView: some View {
        HStack(alignment: .top, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                ZStack(alignment: .top) {
                    AsyncImage(url: game.championImageURL) {
                        $0.resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 40, height: 40)
                    badgeIcon(game.badge)
                        .offset(y: 30)
                }
                VStack(spacing: 2) {
                    ForEach(game.spellImageURLs, id: \.self) { imageURL in
                        AsyncImage(url: imageURL) {
                            $0.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 19, height: 19)
                    }
                }
                .padding(.leading, 4)
                VStack(spacing: 2) {
                    ForEach(game.runeImageURLs, id: \.self) { imageURL in
                        AsyncImage(url: imageURL) {
                            $0.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 19, height: 19)
                    }
                }
                .padding(.leading, 2)
                VStack(alignment: .leading, spacing: 2) {
                    kdaText(kills: game.kills, deaths: game.deaths, assists: game.assists)
                    killParticipationText(game.killParticipation)
                }
                .padding(.leading, 8)
            }
            Spacer(minLength: 14)
            VStack(alignment: .trailing, spacing: 1) {
                Text(game.gameType)
                    .font(.textStyle)
                    .foregroundColor(.coolGrey)
                Text(game.timeAgo)
                    .font(.textStyle)
                    .foregroundColor(.coolGrey)
                Spacer()
            }
        }
    }

    var itemList: some View {
        HStack(alignment: .bottom, spacing: 2) {
            ForEach(0..<7) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.paleGreyTwo)

                    if let imageURL = game.itemImageURLs[safe: index] {
                        AsyncImage(url: imageURL) {
                            $0.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .frame(width: 24, height: 24)
            }
            Spacer()
        }
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

struct GameRow_Previews: PreviewProvider {

    static var previews: some View {
        GameRow(game: .init(gameId: "371807637", isWin: false, gameLength: 1431, gameType: "무작위 총력전", createDate: 1668568946, kills: 5, deaths: 8, assists: 2, killParticipation: "30%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png")!, badge: .mvp, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/1026.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3020.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!]))
    }
}
