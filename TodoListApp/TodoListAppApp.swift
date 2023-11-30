//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by Rohit Kumar on 27/11/2023.
//

import SwiftUI

@main
struct TodoListAppApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
