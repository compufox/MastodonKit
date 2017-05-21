import Foundation

public struct Blocks {
    /// Fetches a user's blocks.
    ///
    /// - Parameter range: The bounds used when requesting data from Mastodon.
    /// - Returns: Request for `[Account]`.
    public static func all(range: RequestRange = .default) -> Request<[Account]> {
        let parameters = range.parameters(limit: between(1, and: 80, fallback: 40))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Account]>(path: "/api/v1/blocks", method: method, parse: Request<[Account]>.parser)
    }
}