//
//  Constants.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 27/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

// Closures
typealias CompletionHandler = (_ Success: Bool) -> ()

// URL_CONSTANTS
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_INFO_ADD = "\(BASE_URL)user/add"

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// USER Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// HEADERS
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
