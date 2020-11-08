//
//  UserDataService.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 28/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        print(avatarName)
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrpped = r else { return defaultColor }
        guard let gUnwrpped = g else { return defaultColor }
        guard let bUnwrpped = b else { return defaultColor }
        guard let aUnwrpped = a else { return defaultColor }
        
        let rfloat = CGFloat(rUnwrpped.doubleValue)
        let gfloat = CGFloat(gUnwrpped.doubleValue)
        let bfloat = CGFloat(bUnwrpped.doubleValue)
        let afloat = CGFloat(aUnwrpped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUIColor
    }
    
}
