//
//  CouponManagerApp.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/24.
//

import SwiftUI

@main
struct CouponManagerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var store = FolderStore()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
