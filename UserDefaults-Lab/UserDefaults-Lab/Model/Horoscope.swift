//
//  Horoscope.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/13/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    var sunsign: String
    var date: String
    var horoscope: String
    var meta: Meta
}

struct Meta: Codable {
    var mood: String
    var intensity: String
}
