//
//  UserDetailVM.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 03/02/24.
//

import Foundation

class UserDetailVM : ObservableObject {
    
    @Published var user: User
    @Published var isLoading = false
    @Published var alertItem: AlertItem?

    init (user:User) {
        self.user = user
        self.fetchUserDetails()
    }
    
    func fetchUserDetails () {
        isLoading = true
        APIService.shared.apiToGetUserDetail(id: user.id, completion: { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let user):
                    self.user = user
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }

            }
        })
    }
    
}
