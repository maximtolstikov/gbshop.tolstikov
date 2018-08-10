//
//  LoginRequest.swift
//  PerfectTemplate
//
//  Created by Maxim Tolstikov on 13/07/2018.
//

import Foundation

struct LoginRequest {
    
    let idUser: Int
    let login: String
    let password: String
    
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
        
    }
}
