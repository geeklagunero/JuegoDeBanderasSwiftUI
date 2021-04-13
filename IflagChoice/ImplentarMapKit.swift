//
//  ImplentarMapKit.swift
//  IflagChoice
//
//  Created by Ricardo Roman Landeros on 07/04/21.
//

import SwiftUI
import MapKit

struct ImplentarMapKit: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 35.65, longitude: 139.65), span: MKCoordinateSpan.init(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    private let lugares: [Location] = [
        Location(cordenada: CLLocationCoordinate2D.init(latitude: 35.67, longitude: 139.65))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: lugares) { lugar in
            MapPin(coordinate: lugar.cordenada, tint: .green)
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var cordenada: CLLocationCoordinate2D
}




struct ImplentarMapKit_Previews: PreviewProvider {
    static var previews: some View {
        ImplentarMapKit()
    }
}
