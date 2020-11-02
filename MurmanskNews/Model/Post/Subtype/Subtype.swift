// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let subtype = try? newJSONDecoder().decode(Subtype.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.subtypeTask(with: url) { subtype, response, error in
//     if let subtype = subtype {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Subtype
struct Subtype: Codable {
    let id: Int
    let title: SubtypeName
    let sort: Int
    let image: JSONNull?
    let iconSettings: IconSettings
    let createdAt, updatedAt: Int
    let deletedAt, entity: JSONNull?
    let annotation, subtypeDescription: String
    let name: SubtypeName

    enum CodingKeys: String, CodingKey {
        case id, title, sort, image
        case iconSettings = "icon_settings"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case entity, annotation
        case subtypeDescription = "description"
        case name
    }
}
