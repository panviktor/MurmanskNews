import Foundation

// MARK: - Post
struct Post: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let images: [String]?
    let entity: String?
    let duration: String?
    let rating: Double?
    
    var debugDescription: String {
        return "\n\n \(id) \n \(title) \n \(description)  \n \(entity)  \n \(duration)  \n\(rating)  \n"
    }
    
    private enum CodingKeys : String, CodingKey {
        case id, title, description, images, entity,  duration, rating
    }
}
