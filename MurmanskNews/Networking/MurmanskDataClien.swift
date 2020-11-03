//
//  MurmanskDataClien.swift
//  MurmanskNews
//
//  Created by Viktor on 03.11.2020.
//

import Foundation

final class MurmanskDataClien {
    private let host =  "murmansk.travel"
    private let path = "/api/trips"
    private var page = 1
    
    var currentPage: URL {
        URLBuilder()
    }
    
    private var maxPage = 1
    private var pageWasLoaded: Set<Int> = []
    
    func getNextURL() -> URL? {
        page += 1
        let nextPage = min(maxPage, page)
        if !pageWasLoaded.contains(page) {
            return URLBuilder(for: nextPage)
        } else {
            return nil
        }
    }
    
    func URLBuilder(for page: Int = 1) -> URL {
        let validPageNumber = max(page, 1)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "\(validPageNumber)"),
        ]
        let baseURLString =  urlComponents.url!.absoluteString
        let finalStringURL = baseURLString
        return URL(string: finalStringURL) ?? URL(string: "https://murmansk.travel/api/trips")!
    }
    
    func fetchData(with currentURL: URL, completion: @escaping (Result<MainDataResponse, DataResponseError>) -> Void) {
        URLSession.shared.dataTask(with: currentURL) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
            else {
                completion(Result.failure(DataResponseError.network))
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(MainDataResponse.self, from: data) else {
                self.pageWasLoaded.insert(self.page)
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            
            completion(Result.success(decodedResponse))
        }.resume()
    }
    
    private func checkMaxPage(maxPage: String?) -> Int {
        let str = maxPage ?? ""
        let firstEquality = str.firstIndex(of: "=") ?? str.endIndex
        let strToInt = str[firstEquality...].dropFirst()
        guard let lastPage = Int(strToInt) else  {
            return 1
        }
        return lastPage
    }
    
}
