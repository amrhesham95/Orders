//
//  OrdersApp.swift
//  Orders
//
//  Created by Amr Hassan on 12.05.25.
//

import SwiftUI

@main
struct OrdersApp: App {
    @StateObject var order = OrdersViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
