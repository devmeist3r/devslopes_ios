//
//  AuthService.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 28/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as? String ?? ""
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let header: HTTPHeaders  = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: header).responseString { response in
            switch response.result {
            case .success:
                completion(true)
            case .failure(let error):
                debugPrint(error as Any)
                completion(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let header: HTTPHeaders  = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_LOGIN, method: .post,  parameters: body, encoding: JSONEncoding.default, headers: header).responseString { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                
                let user = try! JSONDecoder().decode(Auth.self, from: data)
                self.authToken = user.token
                self.userEmail = user.user
                self.isLoggedIn = true
                
                completion(true)
            case .failure(let error):
                completion(false)
                debugPrint(error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header: HTTPHeaders  = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let request = AF.request(URL_USER_INFO_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        request.responseJSON { (response) in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                let user = try! JSONDecoder().decode(User.self, from: data)
                
                let id = user._id
                let color = user.avatarColor
                let avatarName = user.avatarName
                let email = user.email
                let name = user.name
                
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                
                completion(true)
                
            case .failure(let error):
                completion(false)
                debugPrint(error as Any)
            }
        }
    }
}

