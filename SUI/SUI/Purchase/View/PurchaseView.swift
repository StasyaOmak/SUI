//
//  PurchaseView.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import SwiftUI

struct PurchaseView: View {
    
    enum Constant {
        static let privacyLabel = "Privacy Matters"
        static let protectLabel = "Protect your online activities with VPN Plus"
    }
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text(Constant.privacyLabel)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                Text(Constant.protectLabel)
                    .foregroundStyle(.white)
                Spacer()
                ScrollView {
                    
                    VStack(spacing: 30) {
                        ForEach(viewModel.purchases.indices, id: \.self) { index in
                            CalendarView(index: index)
                            
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    @EnvironmentObject private var viewModel: PurchaseViewModel
}

