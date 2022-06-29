//
//  Preferences.swift
//  MastodonKit
//
//  Created by fox on 6/29/22.
//

import Foundation

public class Preference: Codable {
    /// User preferences regarding default post visibility
    public let defaultVisibility: Visibility
    /// User preferences regarding whether posts should always be sensitive
    public let defaultSensitive: Bool
    /// User preferences regarding post languages
    public let defaultLanguage: String?
    /// User preferences regarding showing media
    public let expandMedia: String
    /// User preferences regarding hiding posts with content warnings
    public let expandSpoilers: Bool

    private enum CodingKeys: String, CodingKey {
        case defaultVisibility = "posting:default:visibility"
        case defaultSensitive = "posting:default:sensitive"
        case defaultLanguage = "posting:default:language"
        case expandMedia = "reading:expand:media"
        case expandSpoilers = "reading:expand:spoilers"
    }
}
