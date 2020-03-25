//
//  GoogleMap.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.02.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

private let locationManager = CLLocationManager()

struct GoogleMap: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
        let marker : GMSMarker = GMSMarker()
    
    

            //Creates a `UIView` instance to be presented.
            func makeUIView(context: Self.Context) -> GMSMapView {
                // Create a GMSCameraPosition
                
                let vlatitude = Int(userLatitude) ?? 0
                let vlongitude = Int(userLongitude) ?? 0
                
                let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(vlatitude), longitude: CLLocationDegrees(vlongitude), zoom: 16.0)
                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                mapView.setMinZoom(14, maxZoom: 20)
                mapView.settings.compassButton = true
                mapView.isMyLocationEnabled = true
                mapView.settings.myLocationButton = true
                mapView.settings.scrollGestures = true
                mapView.settings.zoomGestures = true
                mapView.settings.rotateGestures = true
                mapView.settings.tiltGestures = true
                mapView.isIndoorEnabled = false


                if let mylocation = mapView.myLocation {
                  print("User's location: \(mylocation)")
                } else {
                  print("User's location is unknown")
                }

                return mapView
            }

    //        Updates the presented `UIView` (and coordinator) to the latestconfiguration.
            func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
                // Creates a marker in the center of the map.
                let latitude = Int(userLatitude) ?? 0
                let longitude = Int(userLongitude) ?? 0
                
                marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
                marker.title = "My Location"
                marker.snippet = "latitude: \(userLatitude), longitude: \(userLongitude)"
                marker.map = mapView
            }

}

struct GoogleMap_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMap()
    }
}


/*
 import SwiftUI


 struct GoogleMapsView: View {
     //@ObservedObject var viewModel = ContentViewModel()
     @ObservedObject var viewRouter: ViewRouter
     let startColor = Color(hex: "#19334f")
     let endColor = Color(hex: "#102234")
     
     init(_ viewRouter: ViewRouter){
         self.viewRouter = viewRouter
     }
     var body: some View {
         NavigationView {
             ZStack{
                 RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                     .edgesIgnoringSafeArea(.all)
                 VStack {
                     Image("MirasconLogo")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 200.0,height:100, alignment: .bottomLeading)
                     GoogleMap()
                     Button(action: {
                         print("back tapped!")
                         self.viewRouter.currentPage = "camera"
                     }) {
                         Image("arrow-right")
                             .foregroundColor(Color.white)
                         
                     }.frame(minWidth: 0, maxWidth: .infinity)
                         .padding()
                         .padding(.horizontal, 10)
                         .background(endColor)
                         .cornerRadius(10)
                 }//.edgesIgnoringSafeArea(.vertical)
             }.edgesIgnoringSafeArea(.all)
         }
     }
 }

 struct GoogleMapsView_Previews: PreviewProvider {
     static var previews: some View {
         GoogleMapsView(ViewRouter())
     }
 }
 */
