//
//  PlayerViewModel.swift
//  SUI
//
//  Created by Anastasiya Omak on 02/05/2024.
//

import AVFoundation
import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration: Float = 0.0
    private var player: AVAudioPlayer?
    @Published var currentTrack: SongModel?
    private var songModel: [SongModel] = [.init(image: "forest",
                                                avatar: "forest",
                                                singerName: "Неизвестный исполнитель",
                                                songName: "Звуки природы"),
                                          .init(image: "infiniti",
                                                avatar: "infiniti",
                                                singerName: "Инфинити",
                                                songName: "Где ты?"),]
    
    public func play() {
        playSong(model: songModel[0])
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func nextSong() {
        playSong(model: songModel[1])
        player?.play()
    }
    
    public func previousSong() {
        playSong(model: songModel[0])
        player?.play()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
        
    }
    
    public func setTimeFormat(duration: Int) -> String? {
        let minutes = duration / 60
        let seconds = duration % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func playSong(model: SongModel) {
        guard let audioPath = Bundle.main.path(forResource: model.avatar, ofType: "mp3") else { return  }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            currentTrack = model
            maxDuration = Float(player?.duration ?? 0.0)
        } catch {
            print(error.localizedDescription)
        }
    }
}

