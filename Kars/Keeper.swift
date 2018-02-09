//
//  Keeper.swift
//  Kars
//
//  Created by Cristian Rodriguez on 2/8/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation

class cars: KarKeepr {
    var name: String
    var speed = 0
    var year: Int
    var make: String
    var model: String
    var color: String
    var gas = 100
    var maxSpeed: Int
    var tuneup: Bool
    func speedChange(by: Int) {
        if speed + by >= 1 {
            gas = gas - Int(Double((by - speed).signum()) / Double(maxSpeed) * 30.0)
            speed = maxSpeed < speed + by ? maxSpeed : speed + by
            gas = gas >= 0 ? gas : 0
        } else {
            speed = 0
        }
    }
    init(Make: String, Model: String, Year: Int, Color: String, MaxSpeed: Int, Tuned: Bool) {
        self.name = "\(Color) \(Year) \(Make) \(Model)"
        self.make = Make
        self.model = Model
        self.year = Year
        self.color = Color
        self.maxSpeed = Tuned ? Int(Double(MaxSpeed) * 1.5) : MaxSpeed
        self.tuneup = Tuned
    }
}
