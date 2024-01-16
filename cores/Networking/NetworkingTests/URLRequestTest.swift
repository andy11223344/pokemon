//
//  URLRequestTest.swift
//  NetworkingTests
//
//  Created by Andy ⠀ on 05/01/24.
//

import XCTest
@testable import Networking

final class URLRequestTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testValidUrlComponents() {
        let config = NetworkConfigurationSeed(baseUrl: "http://www.abc.com", path: "/test_path", method: .get, parameter: nil, httpHeaders: nil)
        let comps = URLComponents(config: config)
    
        XCTAssertNotNil(comps?.url)
        XCTAssertEqual(comps?.scheme, "http")
        XCTAssertEqual(comps?.host, "www.abc.com")
        XCTAssertEqual(comps?.path, "/test_path")
    }
    
    func testMultiplePath() {
        let config = NetworkConfigurationSeed(baseUrl: "http://www.abc.com/api/v2", path: "/test_path", method: .get, parameter: nil, httpHeaders: nil)
        let comps = URLComponents(config: config)
    
        XCTAssertEqual(comps?.url?.absoluteString, "http://www.abc.com/api/v2/test_path")
    }
    
    func testInvalidUrlPath() {
        //error because no `/` before path
        let config = NetworkConfigurationSeed(baseUrl: "http://www.abc.com", path: "test_path", method: .get, parameter: nil, httpHeaders: nil)
        
        XCTAssertThrowsError(try config.asURLRequest())
    }
    
    func testQueryItems() {
        var config = NetworkConfigurationSeed()
        config.parameter = ["page": "1", "last": "10"]
        
        let comps = URLComponents(config: config)
        XCTAssertNotNil(comps?.queryItems)
        XCTAssertTrue(comps?.queryItems?.count == 2)
        XCTAssertEqual(comps?.queryItems?.first?.value, "1")
        XCTAssertEqual(comps?.queryItems?.last?.value, "10")
    }

}
