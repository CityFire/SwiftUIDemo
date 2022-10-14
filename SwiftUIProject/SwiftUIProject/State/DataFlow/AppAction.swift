//
//  AppAction.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import Foundation

enum AppAction {
    case login(email: String, password: String)
    case accountBehaviorDone(result: Result<User, AppError>)
    case emailValid(valid: Bool)
}
