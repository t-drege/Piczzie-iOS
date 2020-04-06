//
//  UserRouter.swift
//  piczzie
//
//  Created by Thomas on 27/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

enum UserRouter : Router {
   
    //POST method
    case login
    case userInformation
    
    var path: String {
      switch self {
      case .login:
        return "/login"
      case.userInformation:
        return "/api/user/{id}"
      }
    }
}

