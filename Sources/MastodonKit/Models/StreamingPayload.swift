//
//  StreamingPayload.swift
//  MastodonKit
//
//  Created by fox on 3/24/22.
//  Copyright © 2022 MastodonKit. All rights reserved.
//

import Foundation

/*
 
 {
 "stream": ["user"],
 "event":"update" OR "notification" OR "delete",
 "payload": <status> OR <notification> OR <ID str>
 }
 
 */

public enum StreamingPayloadEvent: String, Codable {
    case update = "update"
    case notification = "notification"
    case delete = "delete"
    case filtersChanged = "filters_changed"
}

public class StreamingPayload: Codable {
    public let stream: [String]
    public let event: StreamingPayloadEvent
    public let payload: String

    private enum CodingKeys: String, CodingKey {
        case stream
        case event
        case payload
    }
}
