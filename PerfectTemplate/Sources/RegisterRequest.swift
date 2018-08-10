//
//  RegisterRequest.swift
//  PerfectTemplate
//
//  Created by Maxim Tolstikov on 12/07/2018.
//

import Foundation

struct RegisterRequest {
    
    let idUser: Int
    let login: String
    let password: String
    var email: String = ""
    var gender: String = ""
    var creditCard: String = ""
    var bio: String = ""
    
    init?(_ json: [String: AnyObject]) {
        
        guard
            let idUser = json["id_user"] as? Int,
            let login = json["login"] as? String,
            let password = json["password"] as? String
            else {
                print("Init fail")
                return nil}
        
        self.idUser = idUser
        self.login = login
        self.password = password
        
        if let email = json["email"] as? String{
            self.email = email
        }
        if let gender = json["gender"] as? String{
            self.gender = gender
        }
        if let creditCard = json["credit_card"] as? String{
            self.creditCard = creditCard
        }
        if let bio = json["bio"] as? String{
            self.bio = bio
        }
        
    }
}
