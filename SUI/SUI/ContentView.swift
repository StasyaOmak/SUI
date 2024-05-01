//
//  ContentView.swift
//  SUI
//
//  Created by Anastasiya Omak on 30/04/2024.
//

import SwiftUI
struct ContentView: View {
    @State private var isOnToggle = false
    @State private var isAlert = false
    @State private var isAdd = false
    @State private var cardOneBalance = "50 000 ₽"
    @State private var cardTwoBalance = "100 000 ₽"
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading){
                            Button {
                                isOnToggle.toggle()
                            } label: {
                                
                                Image("card")
                                VStack {
                                    Text(cardOneBalance)
                                        .bold()
                                        .tint(.black)
                                    
                                    Text("MIR  **0001")
                                        .tint(.black)
                                }
                            }
                            Divider()
                            Button {
                                isOnToggle.toggle()
                            } label: {
                                
                                Image("card")
                                VStack {
                                    Text(cardTwoBalance)
                                        .bold()
                                        .tint(.black)
                                    
                                    Text("MIR  **0002")
                                        .tint(.black)
                                }
                            }
                            Divider()
                            Button {
                                isOnToggle.toggle()
                            } label: {
                                Image("card")
                                VStack {
                                    Text("1 000 ₽")
                                        .bold()
                                        .tint(.black)
                                    
                                    Text("MIR  **0003")
                                        .tint(.black)
                                }
                            }
                            Divider()
                            Spacer().frame(height: 300)
                                .padding(.top, 200)
                                .padding(.leading)
                }.padding()

                RoundedRectangle(cornerRadius: 10).fill(.under)
                    .offset(x: isOnToggle ? 200: 0)
                VStack(alignment: .leading) {
                    Text("Карта 1")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical, 40)
                        .offset(x: isOnToggle ? 200: 0)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(.card)
                            .offset(x: isOnToggle ? 200: 0)
                            .frame(width: 360, height: 200)
                        
                        VStack {
                            HStack {
                                VStack(alignment: .leading)  {
                                    Text(cardOneBalance)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .offset(x: isOnToggle ? 200: 0)
                                    Text("доступно").offset(x: isOnToggle ? 200: 0)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                }.padding(20)
                                Spacer()
                            }
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Image("logoMir")
                                    .padding()
                                    .offset(x: isOnToggle ? 200: 0)
                            }
                        }
                    }
                    .frame(width: 360, height: 200)
                    
                    Spacer()
                }
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(.white)
                        .frame(height: 88)
                        .padding(.vertical)
                        .shadow(radius: 3, x: 0, y: 5)
            
                    HStack {
                        VStack(alignment: .leading) {
                            Button(action: {
                                if let balance = Int(cardOneBalance.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "₽", with: "")) {
                                    cardOneBalance = "\(balance + 1000) ₽"
                                }
                                isAdd.toggle()
                            }) {
                                VStack {
                                    Image("add")
                                        .padding(.bottom, 5)
                                    Text("Пополнить")
                                        .tint(.black)
                                    
                                }
                            }.actionSheet(isPresented: $isAdd, content: {
                                ActionSheet(title: Text("Счёт пополнен на 1000,00 ₽"))
                            })
                        }
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                
                                isAlert.toggle()
                            }) {
                                VStack {
                                    Image("transfer")
                                        .padding(.bottom, 5)
                                    Text("Перевести")
                                        .tint(.black)
                                }
                            }
                            .alert(isPresented: $isAlert, content: {
                                Alert(title: Text("Перевод"), message: Text("Перевести 1000 р на карту1?"), primaryButton: .destructive(Text("Ok"), action: {
                                    if let balance = Int(cardTwoBalance.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "₽", with: "")) {
                                        cardTwoBalance = "\(balance + 1000) ₽"
                                    }
                                }), secondaryButton: .cancel())
                            })
                        }
                        Spacer()
                        VStack {
                            Button(action: {
                                isOnToggle.toggle()
                            }) {
                                VStack {
                                    Image("open")
                                        .padding(.bottom, 5)
                                    Text("Открыть \n карту")
                                        .tint(.black)
                                }
                            }
                        }
                    }.padding(.leading, 20)
                        .padding(.trailing, 20)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 50)
                .offset(x: isOnToggle ? 200: 0)
            }
        }
        
        VStack {
            Toggle(isOn: $isOnToggle) {
                Text("Показать мой кошелёк")
            }.padding(.leading, 60)
                .padding(.trailing, 60)
        }.animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3))
    }
}
#Preview {
    ContentView()
}
