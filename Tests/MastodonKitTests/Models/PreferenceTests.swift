//
//  PreferenceTests.swift
//  MastodonKit
//
//  Created by fox on 6/29/22.
//

import XCTest
@testable import MastodonKit

class PreferenceTests: XCTestCase {
    func testPreferenceFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Preference.json")
        let preference = try? Preference.decode(data: fixture)
        
        XCTAssertEqual(preference?.defaultVisibility, .public)
        XCTAssertEqual(preference?.defaultSensitive, false)
        XCTAssertEqual(preference?.defaultLanguage, nil)
        XCTAssertEqual(preference?.expandMedia, "default")
        XCTAssertEqual(preference?.expandSpoilers, false)
    }
    
    func testPreferenceWithInvalidData() {
        let parsed = try? Preference.decode(data: Data())
        
        XCTAssertNil(parsed)
    }
}
