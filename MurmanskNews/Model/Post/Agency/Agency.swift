import Foundation

// MARK: - Agency
struct Agency: Codable {
    let id: Int
    let title: Title
    let cityid: Int
    let mode: Mode
    let address: Address
    let phone: Phone
    let agencyDescription: String
    let createdAt, updatedAt: Int
    let deletedAt: JSONNull?
    let images: [String]
    let latitude, longitude: String
    let userid: JSONNull?
    let status: Status
    let providerid: JSONNull?
    let website: String
    let email: Email
    let logo: String
    let type: AgencyType
    let pivot: AgencyPivot
    let entity: AgencyEntity
    let annotation: String
    let additions: [JSONAny]
    let rating: Int
    let currentUserRating: JSONNull?
    let countRating: Int
    let location: [Double]

    enum CodingKeys: String, CodingKey {
        case id, title
        case cityid = "city_id"
        case mode, address, phone
        case agencyDescription = "description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case images, latitude, longitude
        case userid = "user_id"
        case status
        case providerid = "provider_id"
        case website, email, logo, type, pivot, entity, annotation, additions, rating, currentUserRating, countRating, location
    }
}
