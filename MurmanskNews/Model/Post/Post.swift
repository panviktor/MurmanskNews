import Foundation

// MARK: - Post
struct Post: Codable {
    let id: Int?
    let title: String?
    let datumDescription: String?
    let userid: JSONNull?
    let createdAt, updatedAt: Int
    let deletedAt: JSONNull?
    let level: Int?
    let distance: String?
    let duration: Duration?
    let images: [String]?
    let cityid: Int?
    let type: PostType?
    let angle: JSONNull?
    let cost: Cost?
    let contacts: String?
    let status: Status?
    let direction: [[Double]]?
    let subtypeid, adminid: Int?
    let promo: Bool?
    let tourismTypeid: Int?
    let accessibleEnvironment: Bool?
    let author: JSONNull?
    let city: City?
    let subtype: Subtype?
    let places: [JSONAny]?
    let tags: [Tag]?
    let entity: PostEntity?
    let annotation: String?
    let additions: [JSONAny]?
    let rating: Int?
    let currentUserRating: JSONNull?
    let countRating: Int?
    let agency: Agency?
    let guide: JSONNull?
    let link: String?
    let favorited: Bool?
    let schedules: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case userid = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case level, distance, duration, images
        case cityid = "city_id"
        case type, angle, cost, contacts, status, direction
        case subtypeid = "subtype_id"
        case adminid = "admin_id"
        case promo
        case tourismTypeid = "tourism_type_id"
        case accessibleEnvironment = "accessible_environment"
        case author, city, subtype, places, tags, entity, annotation, additions, rating, currentUserRating, countRating, agency, guide, link, favorited, schedules
    }
}
