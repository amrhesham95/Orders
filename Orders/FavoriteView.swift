//
//  FavoriteView.swift
//  Orders
//
//  Created by Amr Hassan on 14.05.25.
//

import SwiftUI
struct FavoriteView: View {
    @EnvironmentObject var order: OrdersViewModel
    
    var body: some View {
        List {
            ForEach(order.favoriteItems) { item in
                ItemRow(item: item)
            }
        }
    }
}
