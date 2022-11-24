//
//  SummonerAPI.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import Foundation

import Moya

enum SummonerAPI {

    case summoner(name: String)
    case summonerMatches(name: String, lastMatch: UInt?)
}

// MARK: - TargetType Protocol Implementation

extension SummonerAPI: Moya.TargetType {

    var baseURL: URL { Configurations.API.baseURL }

    var path: String {
        switch self {
        case .summoner(let name):
            return "/summoner/\(name)"
        case .summonerMatches(let name, _):
            return "/summoner/\(name)/matches"
        }
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .summoner:
            return .requestPlain
        case .summonerMatches(_, let lastMatch):
            var params: [String: Any] = [:]
            params["lastMatch"] = lastMatch
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }

    var validationType: ValidationType { .successCodes }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
