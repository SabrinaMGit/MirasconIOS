//
//  KeyboardResponder.swift
//  Mirascon
//
//  Created by Dev-Notebook on 02.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    let willset = PassthroughSubject<CGFloat, Never>()
    private var _center: NotificationCenter
    @Published var currentHeight: CGFloat = 0
    var keyboardDuration: TimeInterval = 0

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        _center.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
            keyboardDuration = duration

            withAnimation(.easeInOut(duration: duration)) {
                self.currentHeight = keyboardSize.height
            }

        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        withAnimation(.easeInOut(duration: duration)) {
            currentHeight = 0
        }
    }
}
