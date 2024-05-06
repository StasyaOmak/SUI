//
//  MainTabView.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import SwiftUI

struct MainTabView: View {
    @State var tabSelected = 0
    
    enum Constant {
        static let vpnLabel = "VPN"
        static let purchaseLabel = "Purchase"
        static let basketLabel = "Basket"
        
        static let lockImage = "lock.fill"
        static let listImage = "list.bullet"
        static let basketImage = "basket.fill"
    }
    var body: some View {
        
        TabView {
            VPNView()
                .tabItem {
                    Label(Constant.vpnLabel, systemImage: Constant.lockImage)
                }
                .tag(0)
            PurchaseView()
                .tabItem {
                    Label(Constant.purchaseLabel, systemImage: Constant.listImage)
                }
                .tag(1)
            
            BasketView()
                .tabItem {
                    Label(Constant.basketLabel, systemImage: Constant.basketImage)
                }
                .tag(2)
        }
        .environmentObject(viewModel)
    }
    @ObservedObject var viewModel: PurchaseViewModel = PurchaseViewModel()
}

#Preview {
    VPNView()
}
