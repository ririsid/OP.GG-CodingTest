//
//  APIProvider.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import Combine
import Foundation

import CombineMoya
import Moya

// Moya 래퍼(Wrapper)
final class APIProvider<Target> where Target: Moya.TargetType {

    private let provider: MoyaProvider<Target>

    init() {
        self.provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin()]) // 네트워크 로거 추가
    }

    func request(_ target: Target, callbackQueue: DispatchQueue? = .none) -> AnyPublisher<Moya.Response, APIError> {
        return provider.requestPublisher(target, callbackQueue: callbackQueue)
    }
}
