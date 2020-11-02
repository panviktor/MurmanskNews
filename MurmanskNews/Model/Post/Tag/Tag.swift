// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tag = try? newJSONDecoder().decode(Tag.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.tagTask(with: url) { tag, response, error in
//     if let tag = tag {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name, color: String
    let createdAt, updatedAt: Int
    let deletedAt: JSONNull?
    let pivot: TagPivot
    let entity: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name, color
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case pivot, entity
    }
}
