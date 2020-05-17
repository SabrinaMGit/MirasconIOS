//
//  AlertIdentifier.swift
//  Mirascon
//
//  Created by Dev-Notebook on 17.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct AlertIdentifier: Identifiable {
    enum Choice {
        case first, second, third, forth
    }

    var id: Choice
}
