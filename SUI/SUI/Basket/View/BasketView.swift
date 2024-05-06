//
//  BasketView.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import SwiftUI

struct BasketView: View {
    
    @State private var isBuyButtonTapped = false
    @EnvironmentObject private var viewModel: PurchaseViewModel
    
    
    enum Constant {
        static let choosedLabel = "You choosed"
        static let selectedTariffLabel = "Please check and pay the selected tariff"
        static let buyButton = "Buy"
        static let purchasedButton = "Purchased"
        static let thanksLabel = "Thank you for your purchase!"
        
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 20) {
                        Text(Constant.choosedLabel)
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                    Text(Constant.selectedTariffLabel)
                        .foregroundStyle(.white)
                        tariffInfoView
                        buyButtonView
                        Spacer()
                }
            }
        }
    }
    
    private var tariffInfoView: some View {
        HStack {
            ZStack {
                Image(.calendar)
                Text(viewModel.purchases[viewModel.selectedIndex].days)
                        .font(.system(size: 36))
                        .bold()
                        .padding(.top, 30)
            }
            VStack {
                Text("\(viewModel.purchases[viewModel.selectedIndex].type) (\(viewModel.purchases[viewModel.selectedIndex].duration))\n \(viewModel.purchases[viewModel.selectedIndex].price) RUB")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    private var buyButtonView: some View {
            Button(action: {
                isBuyButtonTapped.toggle()
            }) {
                Text(isBuyButtonTapped ? Constant.purchasedButton : Constant.buyButton)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 342, height: 48, alignment: .center)
            .font(.system(size: 16))
            .foregroundStyle(.white)
            .background(isBuyButtonTapped ? Color.green : Color.blue)
            .cornerRadius(8)
            .alert(isPresented: $isBuyButtonTapped) {
                Alert(title: Text(Constant.thanksLabel), message: Text("You have successfully purchased a tariff \(viewModel.purchases[viewModel.selectedIndex].type) by price \(viewModel.purchases[viewModel.selectedIndex].price) RUB"), dismissButton: .default(Text("Ок")) {
                    isBuyButtonTapped = true
                })
            }
        }
    }
