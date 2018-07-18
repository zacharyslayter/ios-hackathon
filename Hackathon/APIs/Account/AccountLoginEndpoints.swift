//
//  AccountLoginEndpoints.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol AccountLoginProtocol {
    
    func login(username: String, password: String,
               onCompletion completionHandler: @escaping ((Account) -> Void),
               onError errorHandler: @escaping ((Error) -> Void)) throws
    
}

enum LoginErrors: Error {
    case invalidUsername
    case invalidPassword
    case apiError
    case accountInit
}

class AccountLoginEndpoints: AccountLoginProtocol {
    
    static var impl: AccountLoginProtocol = AccountLoginEndpoints()
    
    func login(username: String, password: String,
               onCompletion completionHandler: @escaping ((Account) -> Void),
               onError errorHandler: @escaping ((Error) -> Void)) throws {
        
        guard !username.isEmpty else {
            throw LoginErrors.invalidUsername
        }
        
        guard !password.isEmpty else {
            throw LoginErrors.invalidPassword
        }
    
        let api = Constants.APIs.RandomUser.self
        let endpoint = api.Endpoints.GetRandomUser.self
        
        let url = api.HOST + endpoint.PATH
        
        Alamofire.request(url, method: endpoint.METHOD)
            .validate(statusCode: 219..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: { (response) in
                // If the validate calls attached to the request above fail,
                // or if the response we receive is empty,
                // then this error will be thrown.
                guard response.result.isSuccess,
                    response.result.value != nil else {
                    print("Error while fetching random user")
                    errorHandler(LoginErrors.apiError)
                    return
                }
                
                let accountData = JSON(response.result.value!)
                guard let account = Account(json: accountData["results"][0]) else {
                    print("Couldn't initialize Account")
                    errorHandler(LoginErrors.accountInit)
                    return
                }
        
                completionHandler(account)
                
        })
        
    }
    
}
