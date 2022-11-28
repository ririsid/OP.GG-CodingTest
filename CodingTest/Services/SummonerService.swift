//
//  SummonerService.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import Combine
import Foundation

// summoner API를 제공하는 레이어
final class SummonerService {

    private let apiProvider: APIProvider<SummonerAPI>

    private var cancellables: Set<AnyCancellable> = .init()

    init() {
        self.apiProvider = APIProvider<SummonerAPI>()
    }

    /// 소환사 정보 가져오기
    func fetchSummoner(_ name: String) -> AnyPublisher<Summoner, APIError> {
        return apiProvider.request(.summoner(name: name))
            .compactMap { try? JSONDecoder().decode(SummonerData.self, from: $0.data).summoner }
            .eraseToAnyPublisher()
    }

    /// 소환사 정보 가져오기
    func fetchSummoner(_ name: String) async throws -> Summoner {
        return try await withCheckedThrowingContinuation { continuation in
            fetchSummoner(name)
                .sink { completion in
                    guard case let .failure(error) = completion else { return }
                    continuation.resume(throwing: error)
                } receiveValue: { data in
                    continuation.resume(returning: data)
                }
                .store(in: &cancellables)
        }
    }

    /// 게임 정보 가져오기
    func fetchSummonerMatches(_ name: String, lastMatch: UInt? = nil) -> AnyPublisher<SummonerMatches, APIError> {
        return apiProvider.request(.summonerMatches(name: name, lastMatch: lastMatch))
            .compactMap { try? JSONDecoder().decode(SummonerMatches.self, from: $0.data) }
            .eraseToAnyPublisher()
    }

    /// 게임 정보 가져오기
    func fetchSummonerMatches(_ name: String, lastMatch: UInt? = nil) async throws -> SummonerMatches {
        return try await withCheckedThrowingContinuation { continuation in
            fetchSummonerMatches(name, lastMatch: lastMatch)
                .sink { completion in
                    guard case let .failure(error) = completion else { return }
                    continuation.resume(throwing: error)
                } receiveValue: { data in
                    continuation.resume(returning: data)
                }
                .store(in: &cancellables)
        }
    }

    /// 소환사 및 게임 정보 가져오기
    func fetchSummonerAndMatches(_ name: String) -> AnyPublisher<(Summoner, SummonerMatches), APIError> {
        return fetchSummoner(name)
            .combineLatest(fetchSummonerMatches(name))
            .eraseToAnyPublisher()
    }

    /// 소환사 및 게임 정보 가져오기
    func fetchSummonerAndMatches(_ name: String, lastMatch: UInt? = nil) async throws -> (Summoner, SummonerMatches) {
        return try await withCheckedThrowingContinuation { continuation in
            fetchSummonerAndMatches(name)
                .sink { completion in
                    guard case let .failure(error) = completion else { return }
                    continuation.resume(throwing: error)
                } receiveValue: { data in
                    continuation.resume(returning: data)
                }
                .store(in: &cancellables)
        }
    }
}
