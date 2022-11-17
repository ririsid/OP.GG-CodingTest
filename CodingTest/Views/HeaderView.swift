//
//  HeaderView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

struct HeaderView: View {

    let summoner: SummonerModel

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: summoner.profileImageURL)
                    .frame(width: 88, height: 88)
                    .clipShape(Circle())
                Text("\(summoner.level)")
                    .font(.textStyle5)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .frame(height: 24)
                    .background(Color.darkGrey90)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            VStack(alignment: .leading) {
                Text(summoner.name)
                    .font(.textStyle2)
                    .tracking(-0.7)
                    .foregroundColor(.darkGrey)
                Spacer()
                Button(action: {}) {
                    Text("Refresh Records")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                        .background(Color.softBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .frame(height: 88)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(summoner: .init(name: "genetory", level: 44, profileImageURL: URL(string: "https://opgg-static.akamaized.net/images/profile_icons/profileIcon1625.jpg")!, leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535)]))
    }
}
