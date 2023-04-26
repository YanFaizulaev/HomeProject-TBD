//
//  APIAuthNetwork.swift
//  HomeProject-TBD
//
//  Created by Bandit on 26.04.2023.
//

import UIKit
import Foundation


struct AuthCodeModel: Decodable {
    let is_success : Bool?
}

struct AuthCheckModel : Decodable {
    let refresh_token : String?
    let access_token : String?
    let user_id : Int?
    let is_user_exists : Bool?
}

struct ErrorAuthModel : Decodable {
    let detail : [Detail]?
}

struct Detail : Decodable {
    let loc : [String]?
    let msg : String?
    let type : String?
    
}

class APIAuthNetwork: NetworkServices {
    
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchAuthUserPhone(phone: String, completion: @escaping (Result<AuthCodeModel, APIError>) -> Void) {
        var components = URLComponents(string: "/api/v1/users/send-auth-code/")
        components?.queryItems = [
            URLQueryItem(name: "phone", value: "\(phone)")
        ]
        let url = components?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        print("<<< MARK: 1.0 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
    
    func fetchAuthCheckUser(phone: String, code: String, completion: @escaping (Result<AuthCheckModel, APIError>) -> Void) {
        var components = URLComponents(string: "/api/v1/users/send-auth-code/")
        let url = components?.url
        components?.queryItems = [
            URLQueryItem(name: "phone", value: "\(phone)"),
            URLQueryItem(name: "code", value: "\(code)")
        ]
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        print("<<< MARK: 1.1 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
}
