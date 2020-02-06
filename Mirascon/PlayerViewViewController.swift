//
//  PlayerViewViewController.swift
//  Mirascon
//
//  Created by Dev-Notebook on 21.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import UIKit

struct PlayerViewViewController: UIViewRepresentable  {

   func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    func makeUIView(context: Context) -> UIView {
      return PlayerUIView(frame: .zero)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
