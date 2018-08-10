//
//  LogoutRequest.swift
//  PerfectTemplate
//
//  Created by Maxim Tolstikov on 13/07/2018.
//

import Foundation

struct LogoutRequest {
    
    let idUser: Int
    
    init?(_ json: [String: AnyObject]) {
        
        guard
            let idUser = json["id_user"] as? Int
            else {
                print("Init fail")
                return nil}
        
        self.idUser = idUser
        
    }
}
