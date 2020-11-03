import Foundation

// MARK: - MainData
struct MainDataResponse: Codable {
    var post: [Post]
    let links: Links
    let meta: Meta
    
    private enum CodingKeys : String, CodingKey {
        case post = "data",
             links,
             meta
    }
}
