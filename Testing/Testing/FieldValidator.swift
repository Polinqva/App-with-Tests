//
//  FieldValidator.swift
//  Testing
//
//  Created by Polina Smirnova on 26.02.2023.
//

import Foundation
import UIKit

protocol FieldValidator {
    
    func validateLoginTextField(loginTF: UITextField, passwordNF: UITextField) -> Bool
    
}

class FieldValidatorImpl: FieldValidator {
    func validateLoginTextField(loginTF: UITextField, passwordNF: UITextField) -> Bool {
        return loginTF.hasText && passwordNF.hasText && passwordNF.text == "password123"
    }
}
