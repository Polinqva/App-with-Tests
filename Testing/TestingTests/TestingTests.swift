//
//  TestingTests.swift
//  TestingTests
//
//  Created by Polina Smirnova on 26.02.2023.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {
    
    var fieldValidator: FieldValidator!
    
    override func setUpWithError() throws {
        
        fieldValidator = FieldValidatorImpl()
        
    }
    
    override func tearDownWithError() throws {
        fieldValidator = nil
        
    }
    
    func testValidatorCorrectWithValues() throws {
        
        //Given
        let loginTf = UITextField()
        let passwordTf = UITextField()
        
        let expectedResult = false
        var validateResult: Bool
        
        //When
        validateResult =
        fieldValidator.validateLoginTextField(loginTF: loginTf, passwordTF: passwordTf)
        
        //Then
        XCTAssertEqual(expectedResult, validateResult)
        
        
    }
    func testAsyncValidatorCorrectWithValues() throws {
        //Given
        let loginTf = UITextField()
        let passwordTf = UITextField()
        let expectedResult = false
        var validateResult: Bool?
        let validExpectation = expectation(description: "Expectation in" + #function)
        
        
        //When
        
        fieldValidator.asyncValidateLoginTextFields(loginTF: loginTf, passwordTF: passwordTf) { (isValid) in
            
            validateResult = isValid
            
            validExpectation.fulfill()
        }
        
        //Then
        waitForExpectations(timeout: 2.0) { (error) in
            if error != nil {
                XCTFail()
            }
            
        }
    }
}
