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
                    .onDelete { indexSet in
                        order.items.remove(atOffsets: indexSet)
                    }
                }

                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
}
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(OrdersViewModel())
    }
}
