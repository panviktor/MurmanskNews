import Foundation

// MARK: - City
struct City: Codable {
    let id: Int
    let title: CityName
    let slug: Slug
    let cityDescription, latitude, longitude: String
    let createdAt, updatedAt: Int
    let deletedAt: JSONNull?
    let image: String
    let zoom: Int
    let declension: Declension
    let phone: JSONNull?
    let declensions: [JSONAny]
    let sort: Int
    let entity: CityEntity
    let annotation: String
    let name: CityName
    let location: [Double]
    let placesCount, tripsCount, excursionsCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, slug
        case cityDescription = "description"
        case latitude, longitude
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case image, zoom, declension, phone, declensions, sort, entity, annotation, name, location, placesCount, tripsCount, excursionsCount
    }
}
