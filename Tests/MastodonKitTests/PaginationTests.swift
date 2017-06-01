//
//  PaginationTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/1/17.
//  Copyright (c) 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class PaginationTests: XCTestCase {
    func testPaginationWithInvalidNextAndPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?max_id=420>; rel=\"\"",
            "this is not a valid URL; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNil(pagination.next)
        XCTAssertNil(pagination.previous)
    }

    func testPaginationWithValidNext() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&max_id=420>; rel=\"next\"",
            "this is not a valid URL; rel=\"prev\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNotNil(pagination.next)
        XCTAssertNil(pagination.previous)

        XCTAssertEqual(pagination.next, .max(id: 420, limit: 42))
    }

    func testPaginationWithValidPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=420>; rel=\"prev\"",
            "this is not a valid URL; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNil(pagination.next)
        XCTAssertNotNil(pagination.previous)

        XCTAssertEqual(pagination.previous, .since(id: 420, limit: 42))
    }

    func testPaginationWithValidNextAndPrevious() {
        let links = [
            "<https://mastodon.technology/api/v1/timelines/home?limit=42&since_id=123>; rel=\"prev\"",
            "<https://mastodon.technology/api/v1/timelines/home?limit=52&max_id=321>; rel=\"next\""
            ].joined(separator: ",")

        let pagination = Pagination(string: links)

        XCTAssertNotNil(pagination.next)
        XCTAssertNotNil(pagination.previous)

        XCTAssertEqual(pagination.next, .max(id: 321, limit: 52))
        XCTAssertEqual(pagination.previous, .since(id: 123, limit: 42))
    }
}