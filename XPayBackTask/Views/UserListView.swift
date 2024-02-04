//
//  UserListView.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 01/02/24.
//

import SwiftUI

struct UsersView: View {
    
    //MARK:- PROPERTIES
    @StateObject var usersVM = UserListViewModel()
    @State private var searchText: String = ""
    
    var filteredUsers: [User] {
        if searchText.count == 0 {
            return usersVM.users
        } else {
            return usersVM.users.filter { $0.firstName.lowercased().contains(searchText.lowercased())
            }
        }
    }

    //MARK:- BODY
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(alignment: .leading,spacing: 5){
                    ForEach(filteredUsers, id: \.self) { user in
                        NavigationLink(value: user){
                            UserCell(user: user)
                                .onAppear(){
                                    usersVM.loadMoreContent(currentItem: user)
                                }
                        }
                    }
                }
            }
            .background(Color(uiColor: .systemGray5))
            .refreshable {
                usersVM.page = 0
                usersVM.fetchUsers()
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(userVM: UserDetailVM(user: user))
            }
            .searchable(text: $searchText)
        }
        
        if usersVM.isLoading {
            ActivityIndicator()
                .foregroundColor(.orange)
            .frame(width: 100, height: 100)}
    }
}

//MARK:- PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
