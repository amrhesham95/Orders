//
//  ItemDetail.swift
//  Orders
//
//  Created by Amr Hassan on 12.05.25.
//

import SwiftUI
struct ItemDetail: View {
    @EnvironmentObject var order: OrdersViewModel
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()

                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(item.name)
    }
}


struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example).environmentObject(OrdersViewModel())
        }
    }
}
