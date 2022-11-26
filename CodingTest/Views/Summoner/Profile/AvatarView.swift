//
//  AvatarView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/26.
//

import SwiftUI

struct AvatarView: View {

    let summoner: SummonerModel

    var body: some View {
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
    }
}

struct Avatar_Previews: PreviewProvider {

    static var previews: some View {
        AvatarView(summoner: .init(name: "genetory", level: 44, profileImageURL: URL(string: "https://opgg-static.akamaized.net/images/profile_icons/profileIcon1625.jpg")!, leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), .init(wins: 879, losses: 896, tierName: "자유 5:5 랭크", tier: "Grandmaster", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/grandmaster_1.png")!, lp: 485)]))
    }
}
