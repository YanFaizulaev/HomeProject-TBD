//
//  APIProfile.swift
//  HomeProject-TBD
//
//  Created by Bandit on 26.04.2023.
//

import UIKit

struct ProfileModel : Decodable {
    let profile_data : Profile_data?
}

struct Profile_data : Decodable {
    let name : String?
    let username : String?
    let birthday : String?
    let city : String?
    let vk : String?
    let instagram : String?
    let status : String?
    let avatar : String?
    let id : Int?
    let last : String?
    let online : Bool?
    let created : String?
    let phone : String?
    let completed_task : Int?
    let avatars : Avatars?
}

struct Avatars : Decodable {
    let avatar : String?
    let bigAvatar : String?
    let miniAvatar : String?
}

struct ProfileEditModel : Decodable {
    let avatars : Avatars?
}

class APIProfile: NetworkServices {
    
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchProfileUser(completion: @escaping (Result<ProfileModel, APIError>) -> Void) {
        let components = URLComponents(string: "/api/v1/users/me/")
        let url = components?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        print("<<< MARK: 3.0 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
    
    func fetchEditProfileUser(name: String, username: String, birthday: String, city: String, vk: String, instagram: String, status: String, filename: String, base_64: String, completion: @escaping (Result<ProfileEditModel, APIError>) -> Void) {
        var components = URLComponents(string: "/api/v1/users/me/")
        components?.queryItems = [
            URLQueryItem(name: "name", value: "\(name)"),
            URLQueryItem(name: "username", value: "\(username)"),
            URLQueryItem(name: "birthday", value: "\(birthday)"),
            URLQueryItem(name: "city", value: "\(city)"),
            URLQueryItem(name: "vk", value: "\(vk)"),
            URLQueryItem(name: "instagram", value: "\(instagram)"),
            URLQueryItem(name: "status", value: "\(status)"),
            URLQueryItem(name: "filename", value: "\(filename)"),
            URLQueryItem(name: "base_64", value: "\(base_64)"),
        ]
        let url = components?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        print("<<< MARK: 2.1 URL - \(String(describing: url))")

        perform(request: request, completion: parseDecodable(completion: completion))
    }
}

