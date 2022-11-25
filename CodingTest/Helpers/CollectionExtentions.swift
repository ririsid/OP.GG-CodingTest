//
//  CollectionExtentions.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/19.
//

import Foundation

// `Collection` 인덱스 접근 안전하게 처리
extension Collection {

    public subscript(index: Index, default defaultValue: @autoclosure () -> Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue()
    }

    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
