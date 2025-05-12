//
//  OrderView.swift
//  Orders
//
//  Created by Amr Hassan on 12.05.25.
//

import SwiftUI
struct OrderView : View {
    @EnvironmentObject var order: OrdersViewModel

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }

                Section {
                    NavigationLink("Place Order") {
                        Text("Check out")
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(OrdersViewModel())
    }
}
