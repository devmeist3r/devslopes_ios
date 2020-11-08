//
//  User.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 28/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation


struct User: Codable {
    var _id: String = ""
    var avatarColor: String = ""
    var avatarName: String = ""
    var email: String = ""
    var name: String = ""
}
