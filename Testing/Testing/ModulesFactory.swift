//
//  ModulesFactory.swift
//  Testing
//
//  Created by Polina Smirnova on 26.02.2023.
//

import Foundation
import UIKit

protocol ModulesFactory {
    func getModule(by type: Modules) -> UIViewController
    
}
enum Modules {
    case main
    
}
class ModulesFactoryImpl: ModulesFactory {
    
    func getModule(by type: Modules) -> UIViewController {
        
        switch type {
        case .main:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController")
        }
        
    }
}
