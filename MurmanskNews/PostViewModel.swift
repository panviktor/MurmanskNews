//
//  PostViewModel.swift
//  MurmanskNews
//
//  Created by Viktor on 03.11.2020.
//

import Foundation

protocol PostViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

final class PostViewModel {
    private weak var delegate: PostViewModelDelegate?
    
    private var posts: [Post] = []
    private var currentPage = 1
    private var isFetchInProgress = false
    private var currentURL: URL!
    
    let client = MurmanskDataClien()
    
    init(delegate: PostViewModelDelegate) {
        self.delegate = delegate
        self.currentURL = client.currentPage
    }
    
    var currentCount: Int {
        return posts.count
    }
    
    func post(at index: Int) -> Post {
        return posts[index]
    }
    
    func fetchPosts(first: Bool = true) {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        
        if !first {
            currentURL = client.getNextURL()
        }
        
        client.fetchData(with: currentURL)  { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
                
            case .success(let response):
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.isFetchInProgress = false
                    self.posts.append(contentsOf: response.post)
                    self.delegate?.onFetchCompleted(with: .none)
                    self.isFetchInProgress = false
                }
            }
        }
    }
}
