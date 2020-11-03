import Foundation

enum DataResponseError: Error {
  case network
  case decoding
  
  var reason: String {
    switch self {
    case .network:
      return "An error occurred while fetching data"
    case .decoding:
      return "An error occurred while decoding data"
    }
  }
}
