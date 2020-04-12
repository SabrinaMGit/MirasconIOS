//
//  PlayerView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 21.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation

struct PlayerView: View{
    
    var body: some View {
        PlayerViewController()
    }
}


struct PlayerViewController: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerViewController>) {
    }
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
    func viewWillAppear(_ animated: Bool)  {
    //Trigger notification
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update"), object: nil)

     }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}


class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let videoFileName = "LogoFlieger1280"
        guard let path = Bundle.main.path(forResource: videoFileName, ofType:"mp4") else {
            debugPrint("looping.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        
        player.play()
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(fileComplete),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: nil)
    }
    @objc func fileComplete() {
        PlayerViewController().viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: NSNotification.Name(rawValue: "update"), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //Add Observer
        super.init(coder: aDecoder)
         

      }

    @objc func updateList(){
       //write Reload data here......
         //tableView.reloadData()
        PlayerViewController().viewWillAppear(true)
      }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
