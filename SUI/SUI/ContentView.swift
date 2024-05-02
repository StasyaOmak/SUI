//
//  ContentView.swift
//  SUI
//
//  Created by Anastasiya Omak on 30/04/2024.
//


import SwiftUI

struct ContentView: View {
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    @State private var isShareAlert = false
    @State private var isSaveActionSheet = false
    @State var isPlay = false
    
    var body: some View {
        ZStack {
            Color.grayBackground.edgesIgnoringSafeArea(.all)
            VStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.grayBackground)
                    .aspectRatio(contentMode: .fit)
                    .overlay
                {
                    Image(viewModel.currentTrack?.image ?? "monkey")
                        .resizable()
                        .frame(width: 280, height: 280)
                        .cornerRadius(12).aspectRatio(contentMode: .fit)
                }.padding(50)
                
                HStack{
                    Circle().aspectRatio(1, contentMode: .fit)
                        .overlay {
                            Image(viewModel.currentTrack?.avatar ?? "monkey")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                        .frame(width: 60, height: 60)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            
                            Text(viewModel.currentTrack?.singerName ?? "Artist not found")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(width: 200)
                            
                            Button {
                                isSaveActionSheet.toggle()
                            } label: {
                                Image("save")
                            }.actionSheet(isPresented: $isSaveActionSheet, content: {
                                ActionSheet(title: Text(" Трек \(viewModel.currentTrack?.songName ?? "") сохранен в папку загрузки"))
                            })
                            .padding(5)
                            
                            Button {
                                isShareAlert.toggle()
                            } label: {
                                Image("sent")
                            }.alert("Поделиться?", isPresented: $isShareAlert, actions: {
                                Button("Да", role: .cancel, action: {})
                                Button("Нет", role: .destructive, action: {})
                            })
                        }
                        Text(viewModel.currentTrack?.songName ?? "Song name not found")
                            .font(.system(size: 14))
                            .foregroundStyle(.tintSongName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }.padding()
                }
                HStack {
                    Slider(value: Binding(get: {
                        progress
                    }, set: { newValue in
                        progress = newValue
                        viewModel.setTime(value: newValue)
                    }), in: 0...viewModel.maxDuration).padding()
                    
                    Text(viewModel.setTimeFormat(duration: Int(viewModel.maxDuration)) ?? "0:00")
                    
                    
                }
                .foregroundColor(.white)
                .padding()
                HStack {
                    Button {
                        viewModel.previousSong()
                    } label: {
                        Image(.left)
                            .frame(width: 30, height: 30)
                    }.padding(.leading, 60)
                    Spacer()
                    
                    Button(action: {
                        !isPlay ? viewModel.play() : viewModel.stop()
                        isPlay.toggle()
                    }, label: {
                        Image(!isPlay ? "play" : "pause")
                            .frame(width: 60, height: 60)
                    })
                    
                    Spacer()
                    Button {
                        viewModel.nextSong()
                    } label: {
                        Image(.right)
                            .frame(width: 30, height: 30)
                    } .padding(.trailing, 60)
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    ContentView()
}
