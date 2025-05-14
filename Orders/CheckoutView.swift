//
//  CheckoutView.swift
//  Orders
//
//  Created by Amr Hassan on 12.05.25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: OrdersViewModel
    let paymentTypes = ["Cash", "Credit Card", "Loyalty Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTimes = [ "Now", "Tonight", "Tomorrow Morning"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    @State private var chosenTime: String = "Now"
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }

    var body: some View {
        Form {
            
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }

            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section ("Pickup time") {
                Picker("Time: ", selection: $chosenTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section("Total: \(totalPrice)") {

                Button("Confirm order") {
                    showingPaymentAlert = true
                }
            }
            
        }
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            // add button
        } message: {
            Text("Your total was \(totalPrice) – thank you!")
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(OrdersViewModel())
    }
}
