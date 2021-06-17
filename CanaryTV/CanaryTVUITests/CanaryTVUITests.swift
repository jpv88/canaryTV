//
//  CanaryTVUITests.swift
//  CanaryTVUITests
//
//  Created by Jared Perez Vega on 11/6/21.
//

import XCTest

class CanaryTVUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
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
    
//    @discardableResult
//    func wait(for interval: TimeInterval) -> Self {
//        Thread.sleep(forTimeInterval: interval)
//        return self
//    }
    
}
