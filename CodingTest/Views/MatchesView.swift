//
//  MatchesView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/18.
//

import SwiftUI

import ComposableArchitecture

struct MatchesView: View {

    let store: StoreOf<MatchesReducer>

    // MARK: Views

    var body: some View {
        WithViewStore(store) { viewStore in
            if let matches = viewStore.matches {
                summaryRow(matches)

                ForEach(matches.games) { game in
                    GameRow(game: game)
                        .task {
                            // 마지막 행이 보일 때 더 읽기
                            if game == matches.games.last, !viewStore.isLoading {
                                viewStore.send(.lastItemPresented(game.createDate))
                            }
                        }
                }

                // 더 읽기 중 프로그래스 추가
                if viewStore.isLoading {
                    ProgressRow()
                }
            }
        }
    }

    @ViewBuilder private func summaryRow(_ matches: MatchesModel) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Summary last \(matches.numberOfGames) games") // 로컬라이제이션 적용

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
                Text("Most Win") // 로컬라이제이션 적용

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
                Text("Position") // 로컬라이제이션 적용

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
        .font(.system(size: 10)) // 서체 공통 적용
        .foregroundColor(.coolGrey) // 색상 공통 적용
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
        return "\(wins)W \(losses)L" // 로컬라이제이션 적용
    }

    private func winningPercentageColor(_ winningPercentage: Double) -> Color {
        return winningPercentage == 1 ? .darkishPink : .darkGrey
    }

    private func positionIconName(_ position: String) -> String {
        // 아이콘 이름 합성
        return "iconLol\(position.capitalized)"
    }
}

struct MatchesView_Previews: PreviewProvider {

    static var previews: some View {
        MatchesView(store: .init(
            initialState: .init(matches: .init(wins: 15, losses: 5, kills: 25, deaths: 27, assists: 35, champions: [.init(id: 90, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Malzahar.png?image=w_30&v=1")!, wins: 11, losses: 4), .init(id: 4, imageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/TwistedFate.png?image=w_30&v=1")!, wins: 2, losses: 1)], position: .init(abbreviation: "JNG", wins: 15, losses: 5), games: [.init(gameId: "98745871", isWin: true, gameLength: 1225, gameType: "일반", createDate: 1668574248, kills: 2, deaths: 10, assists: 4, killParticipation: "19%", championImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/champion/Tristana.png")!, badge: .none, spellImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png")!], runeImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/perk/8229.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/perkStyle/8300.png")!], itemImageURLs: [URL(string: "https://opgg-static.akamaized.net/images/lol/item/3198.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/1056.png")!, URL(string: "https://opgg-static.akamaized.net/images/lol/item/3113.png")!], wardImageURL: URL(string: "https://opgg-static.akamaized.net/images/lol/item/3340.png")!, largestMultiKillString: "Double Kill")])),
            reducer: MatchesReducer()
        ))
    }
}
