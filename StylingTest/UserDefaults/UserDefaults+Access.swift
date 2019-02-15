//
//  UserDefaultsBase.swift
//  StylingTest
//
//  Created by Bob De Kort on 14/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation

// MARK: Extension

extension UserDefaults {
    /// Retrieves a Codable object from UserDefaults
    ///
    /// - Parameters:
    ///   - type: Class that conforms to the Codable protocol
    ///   - key: Identifier for the object
    ///   - decoder: Custom JSONDecoder instance. Defaults to JSONDecoder()
    /// - Returns: Codable object for the key, if it exists
    public func retrieve<T: Codable>(_ type: T.Type,
                                     with key: String,
                                     usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T?
    {
        // Checking if the value store is of type Data indicating we need to decode it
        if let data = value(forKey: key) as? Data {
            // Checking if the data is decodable to the requested type
            if let decoded = try? decoder.decode(type.self, from: data) {
                return decoded
            } else {
                print("ERROR: Could not decode value for key '\(key)'")
                return nil
            }
            // Checking if we can find a value with "base" class
        } else if let value = value(forKey: key) as? T {
            return value
        } else {
            print("ERROR: value for the key '\(key)' of type '\(T.self)'")
            return nil
        }
    }
    
    /// Stores a Codable object to UserDefaults
    ///
    /// - Parameters:
    ///   - object: Codable object to store
    ///   - key: Identiefier for the object
    ///   - encoder: Custom JSONEncoder instance, Defaults to JSONEncoder()
    public func store<T: Codable>(object: T,
                                  forKey key: String,
                                  usingEncoder encoder: JSONEncoder = JSONEncoder())
    {
        do {
            switch object {
            // If it is a base class we don't need any encoding
            case is Int, is Bool, is Float, is Double, is String:
                set(object, forKey: key)
            // If it is a custom or other type we will encode it and store it
            default:
                let data = try encoder.encode(object)
                set(data, forKey: key)
            }
        } catch {
            print("ERROR: Could not encode object of type '\(T.self)' for key '\(key)'")
            print(error)
        }
    }
}

// MARK: Example of a UserCache similar to the one in Scandlines

class User: Codable {
    let name: String
    let email: String
    let birthday: Date
    let isPremium: Bool
    let numberOfFriends: Int
    
    init(name: String, email: String, birthday: Date, isPremium: Bool, numberOfFriends: Int) {
        self.name = name
        self.email = email
        self.birthday = birthday
        self.isPremium = isPremium
        self.numberOfFriends = numberOfFriends
    }
}

class UserCache: UserDefaults {
    
    // Static identifiers
    let userIdentifier: String = "User"
    let accessTokenIdentifier: String = "AccessToken"
    let refreshTokenIdentifier: String = "RefreshToken"
    
    // Stores and retrieved the user data of the logged in user using UserDefaults
    var user: User? {
        get {
            return retrieve(User.self,
                            with: Constants.UserDefaultsID.user)
        }
        set {
            if let user = newValue {
                store(object: user,
                      forKey: Constants.UserDefaultsID.user)
            }
        }
    }
    
    // Stores and retrieves access token of the logged in user using UserDefaults
    var accessToken: String? {
        get {
            return retrieve(String.self,
                            with: Constants.UserDefaultsID.accessToken)
        }
        set {
            if let accessToken = newValue {
                store(object: accessToken,
                      forKey: Constants.UserDefaultsID.accessToken)
            }
        }
    }
    
    // Stores and retrieves the refresh token of the logged in user using UserDefaults
    var refreshToken: String? {
        get {
            return retrieve(String.self,
                            with: Constants.UserDefaultsID.refreshToken)
        }
        set {
            if let refreshToken = newValue {
                store(object: refreshToken,
                      forKey: Constants.UserDefaultsID.refreshToken)
            }
        }
    }
}
