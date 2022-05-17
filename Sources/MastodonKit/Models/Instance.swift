//
//  Instance.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public class Instance: Codable {
    /// URI of the current instance.
    public let uri: String
    /// The instance's title.
    public let title: String
    /// A description for the instance.
    public let description: String
    /// An email address which can be used to contact the instance administrator.
    public let email: String
    /// The Mastodon version used by instance (as of version 1.3).
    public let version: String?
    /// A thumbnail image to use for this instance (as of version 1.6.1).
    public let thumbnail: URL?
    /// Some statistics about this instance (as of version 1.6).
    public let stats: InstanceStats?
    /// List of "official" languages used in this instance (as of version 2.3).
    public let languages: [String]?
    /// List of URLs the instance exposes.
    public let urls: InstanceURLs?
    /// The account of the instance administrator.
    public let contactAccount: Account?
    /// The configuration of the instance (glitchsoc entity)
    public let configuration: InstanceConfiguration?

    enum CodingKeys: String, CodingKey {
        case uri
        case title
        case description
        case email
        case version
        case thumbnail
        case stats
        case languages
        case urls
        case contactAccount = "contact_account"
        case configuration
    }
}

public struct InstanceConfiguration: Codable {
    /// Configuration values regarding statuses
    public let statuses: InstanceStatusConfiguration
    /// Configuration values regarding media
    public let mediaAttachments: InstanceMediaConfiguration
    /// Configuration values regarding polls
    public let polls: InstancePollConfiguration
    
    enum CodingKeys: String, CodingKey {
        case statuses
        case mediaAttachments = "media_attachments"
        case polls
    }
}

public struct InstanceStatusConfiguration: Codable {
    /// Max amount of characters for statuses
    public let maxCharacters: Int
    /// Max amount of media attachments allowed per status
    public let maxMediaAttachments: Int
    /// How many characters URLs will take up in status character counts
    public let charactersReservedPerURL: Int
    
    enum CodingKeys: String, CodingKey {
        case maxCharacters = "max_characters"
        case maxMediaAttachments = "max_media_attachments"
        case charactersReservedPerURL = "characters_reserved_per_url"
    }
}

public struct InstanceMediaConfiguration: Codable {
    /// Supported MIME types
    public let supportedMimeTypes: [String]
    /// Size limit for a single image
    public let imageSizeLimit: Int
    public let imageMatrixLimit: Int
    public let videoSizeLimit: Int
    public let videoFrameRateLimit: Int
    public let videoMatrixLimit: Int
    
    enum CodingKeys: String, CodingKey {
        case supportedMimeTypes = "supported_mime_types"
        case imageSizeLimit = "image_size_limit"
        case imageMatrixLimit = "image_matrix_limit"
        case videoSizeLimit = "video_size_limit"
        case videoFrameRateLimit = "video_frame_rate_limit"
        case videoMatrixLimit = "video_matrix_limit"
    }
}

public struct InstancePollConfiguration: Codable {
    /// Maximum number of options for a single poll
    public let maxOptions: Int
    /// Maximum characters allowed per option
    public let maxCharactersPerOption: Int
    /// Minimum time allowed for a poll (in seconds)
    public let minExpiration: Int
    /// Maximum time allowed for a poll (in seconds)
    public let maxExpiration: Int
    
    enum CodingKeys: String, CodingKey {
        case maxOptions = "max_options"
        case maxCharactersPerOption = "max_characters_per_option"
        case minExpiration = "min_expiration"
        case maxExpiration = "max_expiration"
    }
}

public struct InstanceStats: Codable {
    /// Number of users registered in this instance.
    public let userCount: Int
    /// Number of statuses posted in this instance.
    public let statusCount: Int
    /// Number of domains in this instance.
    public let domainCount: Int

    enum CodingKeys: String, CodingKey {
        case userCount = "user_count"
        case statusCount = "status_count"
        case domainCount = "domain_count"
    }
}

public struct InstanceURLs: Codable {
    /// URL used for the streaming API.
    public let streaming: URL?

    enum CodingKeys: String, CodingKey {
        case streaming = "streaming_api"
    }
}
