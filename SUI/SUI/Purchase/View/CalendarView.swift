//
//  CalendarView.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import SwiftUI


struct CalendarView: View {
    enum Constant {
        static let addButton = "Added"
        static let buyButton = "Buy"
    }
    
    var index: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                Image(.calendar)
                Text(viewModel.purchases[index].days)
                        .font(.system(size: 36))
                        .bold()
                        .padding(.top, 30)
            }
            Text("\(viewModel.purchases[index].type) (\(viewModel.purchases[index].duration)) \(viewModel.purchases[index].price) RUB")
                .foregroundColor(.white)
                .font(.system(size: 16))
            Button {
                viewModel.selectedIndex = index
            } label: {
                Text(viewModel.selectedIndex == index ? Constant.addButton : Constant.buyButton)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(width: 100, height: 48)
                    .background(viewModel.selectedIndex == index ? Color.addButton : Color.blue)
                    .cornerRadius(8)
            }
        }
    }
    
    @EnvironmentObject private var viewModel: PurchaseViewModel
}



