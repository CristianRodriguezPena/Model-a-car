//
//  carrr.swift
//  Kars
//
//  Created by Cristian Rodriguez on 2/8/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation

class corvette: cars {
    override init(Make: String, Model: String, Year: Int, Color: String, MaxSpeed: Int, Tuned: Bool) {
        super.init(Make: Make, Model: Model, Year: Year, Color: Color, MaxSpeed: MaxSpeed * 2, Tuned: Tuned)
    }
}

