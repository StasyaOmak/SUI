//
//  ContentView.swift
//  SUI
//
//  Created by Anastasiya Omak on 30/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isError = false
    @State var isErrorTwo = false
    @State var isErrorThree = false
    @State var isErrorFour = false
    @State var alertOneText = "Пример Alert с 2 \nкнопками и логикой"
    @State var alertFourColor = Color.button
    
    fileprivate func addTitle() -> some View {
        
        Text("Alert & ActionSheet")
            .font(Font.custom("Inter", size: 20))
            .fontWeight(.bold)
            .padding(.bottom, 70)
            .offset(x: 0, y: 42)
    }
    
    var body: some View {
        
        addTitle()
        
        HStack(alignment: .top , spacing: 58){
            VStack(alignment: .leading, spacing: 25) {
                Text("Пример Alert")
                    .font(Font.system(size: 14))
                    .fontWeight(.bold)
                    .frame(width: 150, height: 48, alignment: .leading)
                
                Text(alertOneText)
                    .frame(width: 150, height: 48, alignment: .leading)
                    .font(Font.system(size: 14))
                    .fontWeight(.bold)
                
                Text("Пример ActionSheet")
                    .frame(width: 150, height: 48, alignment: .leading)
                    .font(Font.system(size: 14))
                    .fontWeight(.bold)
                
                Text("Пример ActionSheet \nкнопками и логикой")
                    .frame(width: 150, height: 48, alignment: .leading)
                    .font(Font.system(size: 14))
                    .fontWeight(.bold)
                
                
            }
            
            VStack(alignment: .leading, spacing: 25){
                Button(action: {
                    isError.toggle()
                }, label: {
                    Text("Пример")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.button))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                        .alert(isPresented: $isError, content: {
                            Alert(title: Text("Пример"))
                        })
                })
                
                Button(action: {
                    isErrorTwo.toggle()
                }, label: {
                    Text("Пример")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.button))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                        .alert("Кнопка 2", isPresented: $isErrorTwo) {
                            Button("Ok", role: .destructive) {
                                alertOneText = "Замена"
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                })
                
                
                Button(action: {
                    isErrorThree.toggle()
                }, label: {
                    Text("Пример")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(.button))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                }).confirmationDialog("ActionSheet", isPresented: $isErrorThree) {
                    Button("ActionSheet") {}
                }
                
                Button(action: {
                    isErrorFour.toggle()
                }, label: {
                    Text("Пример")
                        .frame(width: 150, height: 48)
                        .foregroundColor(Color.white)
                        .background(Color(alertFourColor))
                        .cornerRadius(10)
                        .shadow(color: Color.gray, radius: 3, x: 0.0, y: 3.0)
                }).confirmationDialog("ActionSheet", isPresented: $isErrorFour, titleVisibility: .visible) {
                    Button("Change Color", role: .destructive, action: {
                        if alertFourColor == Color.red {
                            alertFourColor = Color.button
                        } else {
                            alertFourColor = Color.red
                        }
                    })
                    Button("И так сойдёт", role: .cancel) {}
                } message: {
                    Text("Завтра, завтра, не сегодня")
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        Spacer()
        
    }
}

#Preview {
    ContentView()
}

