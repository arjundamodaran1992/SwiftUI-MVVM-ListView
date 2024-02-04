//
//  UserListViewModel.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 31/01/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    var totalPages = 0
    var page : Int = 0
    var limit = 10
    
    init() {
        fetchUsers()
    }
    
    
    //MARK: - PAGINATION
    func loadMoreContent(currentItem item: User){
            let thresholdIndex = self.users.index(self.users.endIndex, offsetBy: -1)
            if thresholdIndex == item.id, (page + 1) <= totalPages {
                page += 1
                fetchUsers()
            }
        }
    
    func fetchUsers() {
        // API call to retrieve users
        self.isLoading = true
        
        APIService.shared.apiToGetUserData(page: page * limit,completion: { [unowned self] result in
            
            DispatchQueue.main.async {
                if self.page == 0{
                    self.users = []
                }
                self.isLoading = false
                switch result{
                case .success(let items):
                    self.users.append(contentsOf: items.users)
                    self.totalPages = Int(items.total / self.limit)
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
