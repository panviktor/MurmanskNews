import Foundation

// MARK: - Links
struct Links: Codable {
    let first, last: String
    let prev: JSONNull?
    let next: String
}
