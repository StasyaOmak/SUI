//
//  VPNView.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import SwiftUI

struct VPNView: View {
    @State var isToggleOn = false
    
    enum Constant {
        static let expireLabel = "Service will expire after 15 days."
        static let ipAdressLabel = "IP Address"
        static let ipAdressValue = "127.0.0.1"
        static let receivedLabel = "Received"
        static let receivedValue = 0
        static let sentLabel = "Sent"
        static let sentValue = 0
        
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20)  {
                Image(.flag)
                    .frame(width: 150)
                    .padding(.top, 100)
                
                Toggle(isOn: $isToggleOn) {
                }
                .frame(width: 54)
                VStack(spacing: 20) {
                    HStack{
                        Text(Constant.ipAdressLabel)
                        Spacer()
                        Text(Constant.ipAdressValue)
                    }
                    HStack{
                        Text(Constant.receivedLabel)
                        Spacer()
                        Text("\(Constant.receivedValue) MB")
                    }
                    HStack{
                        Text(Constant.sentLabel)
                        Spacer()
                        Text("\(Constant.sentValue) MB")
                    }
                }
                .foregroundStyle(.white)
                .padding([.leading, .trailing], 80)
                
                Spacer()
                Text(Constant.expireLabel)
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
                    .padding(.bottom, 40)
            }
        }
    }
}

