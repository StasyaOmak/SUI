//
//  ContentView.swift
//  SUI
//
//  Created by Anastasiya Omak on 30/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var section = 0
    @State private var isOnVPN = false
    @State private var wifiStates = ["Не подключено", "Подключено"]
    @State private var bluetooth = ["Вкл.", "Выкл"]
    @State private var modemState = ["Выкл","Вкл."]
    @State private var modemSection = 0
    @State private var bluetoothSection = 0
    @State private var wifiSection = 0
    @State private var isOnPlane = false
    @State private var cellularState = [""]
    @State private var isversionUpd = false
    @State private var versionState = [""]
    @State private var appleidState = [""]
    @State private var isAppleid = false
    @State private var appleAccounState = [""]
    @State private var isAccount = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section{
                    HStack {
                        VStack {
                            Image("avatar")                }
                        VStack(alignment: .leading) {
                            Text("Anastasiya")
                                .font(.title)
                            
                            if #available(iOS 16.0, *) { Picker(selection: $isAccount, label: Text("Apple ID, iCloud, контент и покупки").font(.system(size: 11))) {
                                ForEach(0..<appleAccounState.count) {
                                    Text(self.appleAccounState[$0])
                                }
                            }.pickerStyle(.navigationLink)
                            }
                        }
                    }
                    
                    if #available(iOS 16.0, *) { Picker(selection: $isAppleid, label:
                                                            HStack() {
                        Text("Предложения Apple ID")
                            .font(.system(size: 18))
                        
                        Spacer()
                        ZStack {
                            Circle().foregroundColor(.red).frame(width: 25)
                            Text("3").foregroundStyle(.white)
                        }
                    }
                                                        
                    ) {
                        ForEach(0..<appleidState.count) {
                            Text(self.appleidState[$0])
                            
                        }
                    }.pickerStyle(.navigationLink)
                        
                    }
                }
                Section {
                    
                    if #available(iOS 16.0, *) { Picker(selection: $isversionUpd, label:
                                                            HStack() {
                        Text("IOS 17.2: уже доступно")
                            .font(.system(size: 18))
                        
                        Spacer()
                        ZStack {
                            Circle().foregroundColor(.red).frame(width: 25)
                            Text("3").foregroundStyle(.white)
                        }
                    }
                                                        
                    ) {
                        ForEach(0..<versionState.count) {
                            Text(self.versionState[$0])
                        }
                    }.pickerStyle(.navigationLink)
                        
                    }
                }
                Toggle(isOn: $isOnPlane, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).fill(.orange)
                                .frame(width: 30, height: 30)
                            Image(systemName: "airplane")
                                .foregroundColor(.white)
                        }
                        Text("Авиарежим")
                    }
                })
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.blue)
                            .frame(width: 30, height: 30)
                        Image(systemName: "wifi")
                            .foregroundColor(.white)
                    }
                    if #available(iOS 16.0, *) { Picker(selection: $wifiSection, label: Text("Wi-Fi")) {
                        ForEach(0..<wifiStates.count) {
                            Text(self.wifiStates[$0])
                        }
                        
                    }.pickerStyle(.navigationLink)
                    }
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.blue)
                            .frame(width: 30, height: 30)
                        Image("bluetooth")
                            .foregroundColor(.white)
                    }
                    if #available(iOS 16.0, *) { Picker(selection: $bluetoothSection, label: Text("Bluetooth")) {
                        ForEach(0..<bluetooth.count) {
                            Text(self.bluetooth[$0])
                        }
                        
                    }.pickerStyle(.navigationLink)
                    }
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.green)
                            .frame(width: 30, height: 30)
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .foregroundColor(.white)
                    }
                    if #available(iOS 16.0, *) { Picker(selection: $modemSection, label: Text("Сотовая связь")) {
                        ForEach(0..<cellularState.count) {
                            Text(self.cellularState[$0])
                        }
                        
                    }.pickerStyle(.navigationLink)
                    }
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.green)
                            .frame(width: 30, height: 30)
                        Image(systemName: "personalhotspot")
                            .foregroundColor(.white)
                    }
                    if #available(iOS 16.0, *) { Picker(selection: $modemSection, label: Text("Режим модема")) {
                        ForEach(0..<modemState.count) {
                            Text(self.modemState[$0])
                        }
                        
                    }.pickerStyle(.navigationLink)
                    }
                }
                
                Toggle(isOn: $isOnVPN, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).fill(.blue)
                                .frame(width: 30, height: 30)
                            Image(systemName: "network")
                                .foregroundColor(.white)
                        }
                        Text("VPN")
                    }
                })
            }.navigationTitle("Настройки")
                .preferredColorScheme(.dark)
        }
    }
}
#Preview {
    ContentView()
}
