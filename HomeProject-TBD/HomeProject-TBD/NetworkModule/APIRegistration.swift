//
//  APIRegistration.swift
//  HomeProject-TBD
//
//  Created by Bandit on 26.04.2023.
//

import UIKit

struct RegistrationModel : Decodable {
    let refresh_token : String?
    let access_token : String?
    let user_id : Int?
}

class APIRegistration: NetworkServices {
    
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchRegistrationUser(accessToken: String, phone: String, name: String, username: String, completion: @escaping (Result<RegistrationModel, APIError>) -> Void) {
        var components = URLComponents(string: "https://plannerok.ru/openapi.json/api/v1/users/register/")
        components?.queryItems = [
            URLQueryItem(name: "phone", value: "\(phone)"),
            URLQueryItem(name: "name", value: "\(name)"),
            URLQueryItem(name: "username", value: "\(username)")
        ]
        let url = components?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        print("<<< MARK: 2.0 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
    
    func fetchRefreshToken(refreshToken: String, completion: @escaping (Result<RegistrationModel, APIError>) -> Void) {
        var components = URLComponents(string: "https://plannerok.ru/openapi.json/api/v1/users/refresh-token/")
        components?.queryItems = [
            URLQueryItem(name: "refresh_token", value: "\(refreshToken)"),
        ]
        let url = components?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        print("<<< MARK: 2.1 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
}

