//
//  UserDefaults.swift
//  Mirascon
//
//  Created by Dev-Notebook on 30.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import Foundation
extension UserDefaults {
    
    static func isFirstLaunch() -> Bool {
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore")
        
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}
