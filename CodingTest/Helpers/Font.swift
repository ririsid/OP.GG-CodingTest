//
//  Font.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

// 지정 서체
extension Font {

    public static var textStyle: Font {
        .custom("AppleSDGothicNeo-Regular", size: 12)
    }

    public static var textStyle2: Font {
        .system(size: 24, weight: .bold)
    }

    public static var textStyle3: Font {
        .system(size: 18, weight: .bold)
    }

    public static var textStyle4: Font {
        .system(size: 10, weight: .regular)
    }

    public static var textStyle5: Font {
        .system(size: 12, weight: .regular)
    }
}
