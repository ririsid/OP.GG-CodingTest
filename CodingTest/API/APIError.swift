//
//  APIError.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

#if canImport(Moya)
import Moya

typealias APIError = Moya.MoyaError

extension APIError: Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.response == rhs.response
    }
}
#endif
