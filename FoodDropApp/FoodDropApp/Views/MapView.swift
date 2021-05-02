//
//  MapView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 4/15/21.
//

import SwiftUI
import MapKit
import CoreLocation
import Foundation

struct MapView: View {
    private var food: Food_post

    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.0458, longitude: -77.6413),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    init(newFood: Food_post) {
        food = newFood
        region.center = CLLocationCoordinate2D(
            latitude: Double(food.latitude) ?? 39.0458, longitude: Double(food.longitude) ?? -77.6413
        )
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [food]) { f in
//            MapPin(coordinate: CLLocationCoordinate2D(latitude: Double(f.latitude)!, longitude: Double(f.longitude)!))
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(f.latitude)!, longitude: Double(f.longitude)!), anchorPoint: CGPoint(x: 0.5, y: 0.5)){
                VStack{
                Text("\(f.foodType)")
                    .foregroundColor(.black)
                    .bold()
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                        .font(.system(size: 30))
                }
                
            }

        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {        MapView(newFood: Food_post(id: "1", ownerId: "1", foodType: "Wrap", pickupAddress: "12", madeOnDate: "12", pickupDate: "12", isClaimed: false, latitude: "50.1018", longitude: "14.2632", imageId: "12345", rating: 0))
    }
}
