import Foundation

// MARK: - MainData
struct MainData: Codable {
    let post: [Post]
    let links: Links
    let meta: Meta
    
    private enum CodingKeys : String, CodingKey {
        case post = "data",
             links,
             meta
    }
}
