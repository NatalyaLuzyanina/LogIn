//
//  User.swift
//  LogIn
//
//  Created by Nataly on 03.04.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    
    let person: Person
    
    static func getUser() -> User {
        User(login: "User",
             password: "Password",
             person: Person(name: "Natalya",
                            surname: "Luzyanina",
                            age: 26,
                            hobbies: ["Photography", "Stretching"],
                            birthplace: "Komi Republic",
                            livingCity: "Saint-Petersburg",
                            hobbyDescription: """
                                              My favorite hobby is photography. What I like about photographs is that they capture a moment that's gone forever, impossible to reproduce.
                                              """))
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let hobbies:[String]
    let birthplace: String
    let livingCity: String
    let hobbyDescription: String
}
