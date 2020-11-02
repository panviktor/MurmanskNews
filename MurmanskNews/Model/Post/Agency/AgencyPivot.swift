import Foundation

// MARK: - AgencyPivot
struct AgencyPivot: Codable {
    let tripid, agencyid: Int

    enum CodingKeys: String, CodingKey {
        case tripid = "trip_id"
        case agencyid = "agency_id"
    }
}
