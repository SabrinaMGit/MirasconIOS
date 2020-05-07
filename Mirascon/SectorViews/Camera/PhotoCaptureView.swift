//
//  PhotoCaptureView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {

    @Binding var showImagePicker: Bool
    @Binding var image: Image?


    var body: some View {
        CameraViews(showCameraView: $showImagePicker, pickedImage: $image)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
#endif
