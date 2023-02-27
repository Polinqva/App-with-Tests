//
//  FieldValidator.swift
//  Testing
//
//  Created by Polina Smirnova on 26.02.2023.
//

import Foundation
import UIKit

protocol FieldValidator {
    
    func validateLoginTextField(loginTF: UITextField, passwordTF: UITextField) -> Bool
    func asyncValidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void)
    
}

class FieldValidatorImpl: FieldValidator {
    func validateLoginTextField(loginTF: UITextField, passwordTF: UITextField) -> Bool {
        return loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
    }
    
    func asyncValidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5, execute: {
            
            DispatchQueue.main.async {
            let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "password123"
            completion(result)
        }
    })
}
}

