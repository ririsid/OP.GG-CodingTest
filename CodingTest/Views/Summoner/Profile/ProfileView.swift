//
//  ProfileView.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/26.
//

import SwiftUI

import ComposableArchitecture

struct ProfileView: View {

    let store: StoreOf<SummonerReducer>

    var body: some View {
        WithViewStore(store) { viewStore in
            if let summoner = viewStore.summoner {
                HStack(spacing: 16) {
                    AvatarView(summoner: summoner)

                    VStack(alignment: .leading) {
                        Text(summoner.name)
                            .font(.textStyle2)
                            .tracking(-0.7)
                            .foregroundColor(.darkGrey)

                        Spacer()

                        Button(action: {
                            viewStore.send(.updateButtonTapped)
                        }) {
                            ZStack {
                                Text("Update") // 로컬라이제이션 적용
                                    .font(.system(size: 14))
                                    .foregroundColor(viewStore.isUpdating ? .clear : .white) // 로딩 중 글자 숨김(프로그래스 추가)
                                    .padding(.horizontal, 20)
                                    .frame(height: 40)
                                    .background(.softBlue.opacity(viewStore.isUpdating ? 0.3 : 1)) // 로딩 중 비활성화
                                    .clipShape(RoundedRectangle(cornerRadius: 20))

                                // 로딩 중 프로그래스 추가
                                if viewStore.isUpdating {
                                    ProgressView()
                                }
                            }
                        }
                        .disabled(viewStore.isUpdating) // 로딩 중 비활성화
                    }
                    .frame(height: 88)

                    Spacer()
                }
                .padding(16)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {

    static var previews: some View {
        ProfileView(store: .init(
            initialState: .init(summoner: .init(name: "genetory", level: 44, profileImageURL: URL(string: "https://opgg-static.akamaized.net/images/profile_icons/profileIcon1625.jpg")!, leagues: [.init(wins: 345, losses: 940, tierName: "솔랭", tier: "Silver", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/silver_1.png")!, lp: 535), .init(wins: 879, losses: 896, tierName: "자유 5:5 랭크", tier: "Grandmaster", tierImageURL: URL(string: "https://opgg-static.akamaized.net/images/medals/grandmaster_1.png")!, lp: 485)])),
            reducer: SummonerReducer()
        ))
    }
}
