//
//  AppState.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import Combine
import SwiftUI

struct AppState {
    var settings = Settings()
}

extension AppState {
    class Settings: ObservableObject {
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        
        
//        class AccountChecker {
            @Published var accountBehavior = AccountBehavior.login
            @Published var email = ""
            @Published var password = ""
            @Published var verifyPassword = ""
            
//            var isEmailValid: AnyPublisher<Bool, Never> {
//                let remoteVerify = $email
//                    .debounce(for: .microseconds(500), scheduler: DispatchQueue.main)
//                    .removeDuplicates()
//                    .flatMap { email -> AnyPublisher<Bool, Never> in
//                        let validEmail = email.isValidEmailAddress
//                        let canSkip = self.accountBehavior == .login
//                        switch (validEmail, canSkip) {
//
////                        }
//                    }
//            }
//        }
        
//        var checker = AccountChecker()
        
        var isEmailValid: Bool = false
        
        @Published var showEnglishName = true
        @Published var sorting = Sorting.id
        @Published var showFavoriteOnly = false
        
//        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        
        var loginRequesting = false
        var loginError: AppError?
    }
    
}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}


