//
//  Map.swift
//  Mirascon
//
//  Created by Dev-Notebook on 15.08.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MapKit
/*
struct Map: View {
    @ObservedObject var viewRouter: ViewRouter
      
      init(_ viewRouter: ViewRouter){
          self.viewRouter = viewRouter
          UITableView.appearance().backgroundColor = .clear
          UITableViewCell.appearance().backgroundColor = .clear
      }
    var body: some View {
        MapView()
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map(ViewRouter())
    }
}

struct MapView: UIViewRepresentable {
  
  var locationManager = CLLocationManager()
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
}
*/
