//
//  CanaryTVUITests.swift
//  CanaryTVUITests
//
//  Created by Jared Perez Vega on 11/6/21.
//

import XCTest

class CanaryTVUITests: XCTestCase {
       
    func testListScreen() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 6)
        XCTAssertTrue(app.otherElements["HomeView"].exists)
    }
    
    func testDetailScreen() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 6)
        app.collectionViews.cells.element(boundBy:0).tap()
        Thread.sleep(forTimeInterval: 6)
        XCTAssertTrue(app.otherElements["DetailView"].exists)
    }
    
    func testTrailer() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 6)
        app.collectionViews.cells.element(boundBy:0).tap()
        Thread.sleep(forTimeInterval: 6)        
        app.buttons["TrailerButton"].tap()
        Thread.sleep(forTimeInterval: 6)
        XCTAssertTrue(app.otherElements["PlayerView"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
