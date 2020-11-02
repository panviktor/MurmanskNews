// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tagPivot = try? newJSONDecoder().decode(TagPivot.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.tagPivotTask(with: url) { tagPivot, response, error in
//     if let tagPivot = tagPivot {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - TagPivot
struct TagPivot: Codable {
    let tripid, tagid: Int

    enum CodingKeys: String, CodingKey {
        case tripid = "trip_id"
        case tagid = "tag_id"
    }
}
