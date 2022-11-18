//
//  HeaderView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

struct HeaderView: View {

    let summoner: SummonerModel

    // MARK: Views

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            profile
            leagues
        }
        .padding(.vertical, 8)
    }

    var profile: some View {
        HStack(spacing: 16) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: summoner.profileImageURL) {
                    $0.resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 88, height: 88)
                Text("\(summoner.level)")
                    .font(.textStyle5)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .frame(height: 24)
                    .background(.darkGrey90)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            VStack(alignment: .leading) {
                Text(summoner.name)
                    .font(.textStyle2)
                    .tracking(-0.7)
                    .foregroundColor(.darkGrey)
                Spacer()
                Button(action: {}) {
                    Text("Update")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                        .background(.softBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .frame(height: 88)
            Spacer()
        }
        .padding(16)
    }

    var leagues: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(summoner.leagues) { league in
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
                                Text(league.tier)
                                    .font(.textStyle3)
                                    .foregroundColor(.darkGrey)
                                Spacer(minLength: 1)
                                Text(makeLPString(league.lp))
                                    .font(.system(size: 12))
                                    .foregroundColor(.darkGrey)
                                Spacer(minLength: 1)
                                Text(makeWinLoseString(wins: league.wins, losses: league.losses, winningPercentage: league.winningPercentage))
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
                        .frame(width: max(0, (proxy.size.width - 48)))
                        .background(.white)
                        .cornerRadius(4)
                        .shadow(color: .steelGrey.opacity(0.2), radius: 3, y: 4)
                    }
                }
            }
        }
        .frame(height: 100)
        .padding(8)
    }

    // MARK: Methods

    private func makeLPString(_ lp: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let value = formatter.string(from: NSNumber(value: lp)) ?? "-"
        return "\(value) LP"
    }

    private func makeWinLoseString(wins: Int, losses: Int, winningPercentage: String) -> String {
        return "\(wins)승 \(losses)패 (\(winningPercentage))"
    }
}

struct HeaderView_Previews: PreviewProvider {

    static var previews: some View {
        HeaderView(summoner: .init(name: "genetory", level: 44, profileImageURL: URL(string: "https://opgg-static.akamaized.net/images/profile_icons/profileIcon1625.jpg")!, leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), .init(wins: 879, losses: 896, tierName: "자유 5:5 랭크", tier: "Grandmaster", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/grandmaster_1.png")!, lp: 485)]))
            .background(.paleGrey)
    }
}
