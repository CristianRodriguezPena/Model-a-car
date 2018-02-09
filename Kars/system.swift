//
//  system.swift
//  Kars
//
//  Created by Cristian Rodriguez on 2/8/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation


class KarKeepr {
    var on = true
    func turnOn() {
        print("""
        ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
        ΞΞ  Welcome to the New Kar-Keeper System,  ΞΞ
        ΞΞ    Where we make Car Managment Easy     ΞΞ
        ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
        """)
        mainMenu()
    }
    func mainMenu() {
        while on{
            print("""

                        ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
                        ΞΞ  Main Menu  ΞΞ
                        ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ

        """)
            var read = ""
            repeat {
                print("""
                                  1 -
                            Create a new car
                                
                                  2 -
                            Use Existing car

                                  3 -
                                 Quit


            """)
                read = readLine()!
            } while !("123").contains(Array(read)[0])
            switch Int(read)! {
            case 1:
                creation()
            case 2:
                contrl(Make: "Chevrolet", Model: "Corvette", Year: 2003, Color: "Yellow Flames", MaxSpeed: 200, Tuned: true)
            default:
                print("Goodbye ")
                on = false
            }
        }
    }
    func creation() {
        var holder = ""
        var keeper = [""]
        let printer = ["Year of Car?", "What Color??", "What Make??", "What model??", "What is the max speed??", "Would you like to tune it??" ]
        keeper.removeAll()
        print("""
                            ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
                            ΞΞ  Lets Begin  ΞΞ
                            ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
            
            """)
        for i in 0...6 {
            repeat {
                print("""
                    
                                      \(printer[i])
                    """)
                holder = readLine()!
            } while  i == 0 || i == 4 ? !(1...2020).contains(Int(holder)!) : false
            keeper.append(holder)
        }
        contrl(Make: keeper[2], Model: keeper[3], Year: Int(keeper[0])!, Color: keeper[1], MaxSpeed: Int(keeper[4])!, Tuned: keeper[5].lowercased().contains("yes"))
    }
    func contrl(Make: String, Model: String, Year: Int, Color: String, MaxSpeed: Int, Tuned: Bool) {
        var read: String
        var use = cars(Make: Make, Model: Model, Year: Year, Color: Color, MaxSpeed: MaxSpeed, Tuned: Tuned)
        if Model == "Corvette" {
            use = corvette(Make: Make, Model: Model, Year: Year, Color: Color, MaxSpeed: MaxSpeed, Tuned: Tuned)
        }
        var keep = true
        while keep {
            repeat {
                print("""
                    
                            ΞΞΞ  \(use.name)  ΞΞ
                    
                                Gas is \(use.gas)%  ΞΞΞ Speed is at \(use.speed) Mph
                    
                                          1 -
                                      Accelarate!!
                    
                                          2 -
                                      Decelarate!!
                    
                                          3 -
                                   Fuel up the car!!
                    
                                          4 -
                                      Main Menu!!
                    
                    """)
                read = readLine()!
            } while !("1234").contains(Array(read)[0])
            switch Int(read)! {
            case 1:
                if use.gas >= 1 {
                    print("         by How much would you like to accelerate by")
                    use.speedChange(by: Int(readLine()!)!)
                } else {
                    print("Gas is Empty")
                }
            case 2:
                if use.gas >= 1 {
                    print("         by How much would you like to decelerate by")
                    use.speedChange(by: -1 * Int(readLine()!)!)
                } else {
                    print("                           Gas is Empty")
                }
            case 3:
                print("                                Refuelling..")
                use.gas = 100
                use.speed = 0
            default:
                print("                                  Loading...")
                keep = false
            }
        }
    }
    init(){
    }
}
