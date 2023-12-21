//
//  Ultimate_portfolioApp.swift
//  Ultimate portfolio
//
//  Created by Bartosz Markowski on 10/12/2023.
//

import SwiftUI

@main
struct Ultimate_portfolioApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
              SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
