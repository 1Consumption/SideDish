//
//  HTTPHeadersTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/29.
//

@testable import SideDish
import XCTest

class HTTPHeadersTests: XCTestCase {
    
    private var httpHeader: HTTPHeaders!
    
    override func setUpWithError() throws {
        httpHeader = HTTPHeaders()
    }
    
    func testSetValue() {
        httpHeader.setValue(value: "value1", field: "field1")
        XCTAssertEqual(httpHeader.list, ["field1": "value1"])
        
        httpHeader.setValue(value: "value2", field: "field1")
        XCTAssertEqual(httpHeader.list, ["field1": "value2"])
    }
}
