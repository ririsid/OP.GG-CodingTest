//
//  ProgressRow.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/24.
//

import SwiftUI

// 더 읽기할 때 사용
struct ProgressRow: View {

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ProgressView()
            Spacer()
        }
        .frame(height: 40)
    }
}

struct ProgressRow_Previews: PreviewProvider {

    static var previews: some View {
        ProgressRow()
    }
}
