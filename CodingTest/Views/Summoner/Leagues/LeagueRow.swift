//
//  LeagueRow.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/26.
//

import SwiftUI

struct LeagueRow: View {

    let league: SummonerModel.League
    let width: CGFloat

    // MARK: Views

    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: league.tierImageURL) {
                $0.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 64, height: 64)

            VStack(alignment: .leading, spacing: 0) {
                Text(league.tierName)
                    .font(.textStyle)
                    .foregroundColor(.softBlue)

                Spacer(minLength: 0)

                Text(league.tier)
                    .font(.textStyle3)
                    .foregroundColor(.darkGrey)

                Spacer(minLength: 1)

                Text(makeLPString(league.lp))
                    .font(.system(size: 12))
                    .foregroundColor(.darkGrey)

                Spacer(minLength: 1)

                Text(makeWinLoseString(league.wins, league.losses, winningPercentage: league.winningPercentageString))
                    .font(.textStyle4)
                    .foregroundColor(.steelGrey)
            }
            .frame(height: 64)

            Spacer(minLength: 0)

            Image("iconArrowRight")
                .background(Circle()
                    .fill(.paleGrey)
                    .frame(width: 40, height: 40))
        }
        .frame(height: 64)
        .padding(.leading, 12)
        .padding(.trailing, 16)
        .padding(.vertical, 18)
        .frame(width: width)
        .background(.white)
        .cornerRadius(4)
        .shadow(color: .steelGrey.opacity(0.2), radius: 3, y: 4)
    }

    // MARK: Methods

    private func makeLPString(_ lp: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let value = formatter.string(from: NSNumber(value: lp)) ?? "-"
        return "\(value) LP"
    }

    private func makeWinLoseString(_ wins: Int, _ losses: Int, winningPercentage: String) -> LocalizedStringKey {
        return "\(wins)W \(losses)L (\(winningPercentage))" // 로컬라이제이션 적용
    }
}

struct LeagueRow_Previews: PreviewProvider {

    static var previews: some View {
        LeagueRow(league: .init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), width: 327)
    }
}
