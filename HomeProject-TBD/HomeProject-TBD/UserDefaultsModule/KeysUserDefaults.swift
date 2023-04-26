//
//  KeysUserDefaults.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

enum KeysUserDefaults {
    static let userIsLogged = "userIsLogged"
    static let userHasRegistered = "userHasRegistered"
    
    static let userPhone = "userPhone"
    static let refreshTokenUser = "refreshTokenUser"
    static let accessTokenUser = "accessTokenUser"
    static let userID = "userID"
    static let nameUser = "nameUser"
    static let nickNameUser = "tokenUser"
    
}

extension UserDefaults {
    @objc dynamic var userIsLogged: Bool {
        return bool(forKey: KeysUserDefaults.userIsLogged)
    }
    @objc dynamic var newUser: Bool {
        return bool(forKey: KeysUserDefaults.userHasRegistered)
    }
    @objc dynamic var userPhone: String {
        return string(forKey: KeysUserDefaults.userPhone) ?? ""
    }
    @objc dynamic var refreshTokenUser: String {
        return string(forKey: KeysUserDefaults.refreshTokenUser) ?? ""
    }
    @objc dynamic var accessTokenUser: String {
        return string(forKey: KeysUserDefaults.accessTokenUser) ?? ""
    }
    @objc dynamic var userID: Int {
        return integer(forKey: KeysUserDefaults.userID)
    }
    @objc dynamic var nameUser: String {
        return string(forKey: KeysUserDefaults.nameUser) ?? ""
    }
    @objc dynamic var nickNameUser: String {
        return string(forKey: KeysUserDefaults.nickNameUser) ?? ""
    }
}
