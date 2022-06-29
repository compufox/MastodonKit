//
//  Preferences.swift
//  MastodonKit
//
//  Created by fox on 6/29/22.
//

import Foundation

/// `Preference` requests
public enum Preferences {
    /// Gets the current user's preferences
    ///
    /// - Returns: Request for `Preference`.
    public static func userPreferences() -> Request<Preference> {
        return Request<Preference>(path: "/api/v1/preferences")
    }
}
