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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
