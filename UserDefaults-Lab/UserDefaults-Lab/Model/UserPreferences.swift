//
//  UserPreferences.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/16/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import Foundation

struct UserPreferenceKey {
    static let sign = "Sign"
    static let name = "Name"
}

class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func updateSign(sign: String) {
        
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.sign)
    }
    
    func getSign() -> String {
        guard let userSign = UserDefaults.standard.object(forKey: UserPreferenceKey.sign) as? String  else {
            return "gemini"
        }
        return userSign
    }
    
    func updateName(name: String) {
        UserDefaults.standard.set(name, forKey: UserPreferenceKey.name)
    }
    
    func getName() -> String? {
        guard let userName = UserDefaults.standard.object(forKey: UserPreferenceKey.name) as? String  else {
                return nil
            }
            return userName
        }
    }
