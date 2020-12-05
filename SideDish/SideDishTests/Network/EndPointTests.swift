//
//  EndPointTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/29.
//

@testable import SideDish
import XCTest

class EndPointTests: XCTestCase {
    
    func testEndpointMain() {
        XCTAssertEqual(EndPoint.init(path: .main).url, URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/main"))
    }
    
    func testEndpointSoup() {
        XCTAssertEqual(EndPoint.init(path: .soup).url, URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/soup"))
    }
    
    func testEndpointSide() {
        XCTAssertEqual(EndPoint.init(path: .side).url, URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/side"))
    }
    
    func testEndpointDetail() {
        XCTAssertEqual(EndPoint.init(path: .detail("test")).url, URL(string: "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/detail/test"))
    }
}
