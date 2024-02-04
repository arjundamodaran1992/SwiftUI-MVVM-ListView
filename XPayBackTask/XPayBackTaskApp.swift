//
//  XPayBackTaskApp.swift
//  XPayBackTask
//
//  Created by Arjun on 31/01/24.
//

import SwiftUI

@main
struct XPayBackTaskApp: App {
    @StateObject var viewModel = UserListViewModel()

    var body: some Scene {
        WindowGroup {
            UsersView()
        }
    }
}
