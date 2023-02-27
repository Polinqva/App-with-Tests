//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Polina Smirnova on 26.02.2023.
//

import XCTest

final class TestingUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        
        app.buttons["Next:"].tap()
        app.secureTextFields["PasswordTF"].typeText("password")
        app.buttons["Done"].tap()
        
        XCTAssert(app.alerts["Warning"].descendants(matching: .staticText)["Invalid Fields"].waitForExistence(timeout: 1.0))
    }
    
    func testNextScreenExistsAfterLoginExample() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        
        app.buttons["Next:"].tap()
        app.secureTextFields["PasswordTF"].typeText("password123")
        app.buttons["Done"].tap()
        
        XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
        
    }
}
