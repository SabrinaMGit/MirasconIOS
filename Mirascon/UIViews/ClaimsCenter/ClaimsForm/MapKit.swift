//
//  MapKit.swift
//  Mirascon
//
//  Created by Dev-Notebook on 16.08.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MapKit
import Foundation
import UIKit

struct MapKit: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var locationManagers = LocationManagers()
    
    init(_ viewRouter: ViewRouter, _ locationManagers: LocationManagers){
        self.viewRouter = viewRouter
        self.locationManagers = locationManagers }
    
        @State private var landmarks: [Landmark] = [Landmark]()
        @State private var search: String = ""
        @State private var tapped: Bool = false
  
        private func getNearByLandmarks() {
            
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = search
            
            let search = MKLocalSearch(request: request)
            search.start { (response, error) in
                if let response = response {
                    
                    let mapItems = response.mapItems
                    self.landmarks = mapItems.map {
                        Landmark(placemark: $0.placemark)
                    }
                    
                }
                
            }
            
        }
        
        func calculateOffset() -> CGFloat {
            
            if self.landmarks.count > 0 && !self.tapped {
                return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
            }
            else if self.tapped {
                return 100
            } else {
                return UIScreen.main.bounds.size.height
            }
        }
        
        var body: some View {
            ZStack(alignment: .top) {
                
                MapView(landmarks: landmarks)
                
                TextField("Search", text: $search, onEditingChanged: { _ in })
                {
                    // commit
                    self.getNearByLandmarks()
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .offset(y: 44)
                
                PlaceListView(landmarks: self.landmarks) {
                    // on tap
                    self.tapped.toggle()
                }.animation(.spring())
                    .offset(y: calculateOffset())
                
            }
        }
    }



struct MapKit_Previews: PreviewProvider {
    static var previews: some View {
        MapKit(ViewRouter(), LocationManagers())
    }
}

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    //@State public var lCoordinate: CLLocationCoordinate2D
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 20)
                .background(Color.blue)
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            
            List {
                
                ForEach(self.landmarks, id: \.id) { landmark in
                    Button(action: {
                        //give here the annotation for the new center location
                        print(landmark.coordinate)
                        //self.lCoordinate = landmark.coordinate
                    }) {
                    VStack(alignment: .leading) {
                        
                        Text(landmark.name)
                            .fontWeight(.bold)
                        
                        Text(landmark.title)
                    }
                    }
                }
                
            }.animation(nil).background(Color.white)
            
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
//----


class Coordinators: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
                mapView.setRegion(region, animated: true)
                if annotation is MKUserLocation {
                    
                    //type here the CLLocationCoordinate2D for your destination center view place
                    
                    
                }
            }
        }
        
    }
}

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark] //showed all places in list
    //var marker: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinators {
        Coordinators(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
        updateAnnotations(from: uiView)
        //let span = MKCoordinateSpan(self.landmarks.map(LandmarkAnnotation.init))
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        //change this for annotate only one place and not the whole map
        
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
        /*
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        annotation.title = "Marker"
        annotation.subtitle = "Place"
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
        
        let location = CLLocationCoordinate2D(latitude: 35.689949, longitude: 139.697576)
        var pointAnnotation:CustomPointAnnotation!
        var pinAnnotationView:MKPinAnnotationView!
        pointAnnotation = CustomPointAnnotation()
        //pointAnnotation.pinCustomImageName = "Pokemon Pin"
        pointAnnotation.coordinate = location
        pointAnnotation.title = "POKéSTOP"
        pointAnnotation.subtitle = "Pick up some Poké Balls"
        
        pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: "pin")
        mapView.addAnnotations(pinAnnotationView.annotation! as! [MKAnnotation])
         */
    }
    
}
//is for the custome annotation
class CustomPointAnnotation: MKPointAnnotation {
var pinCustomImageName:String!
}
//-----

class LocationManagers: NSObject, ObservableObject {
    
    private let locationManagers = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        
        super.init()
        self.locationManagers.delegate = self
        self.locationManagers.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManagers.distanceFilter = kCLDistanceFilterNone
        self.locationManagers.requestWhenInUseAuthorization()
        self.locationManagers.startUpdatingLocation()
        
    }
    
}

extension LocationManagers: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
}
 
//----

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
//---
struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
