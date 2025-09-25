//
//  LibraryView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI
import MapKit

struct LibraryView: View {
    @State private var selectedSegment = 0
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), // Los Angeles
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    )
    
    let segments = ["Locations", "Photos", "Videos", "Documents", "Maps"]
    let headerHeight: CGFloat = 100
    
    var body: some View {
        ZStack {
            // Full-screen map background
            Map(position: $cameraPosition) {
                // Sample map annotations based on your reference image
                Annotation("Santa Clarita", coordinate: CLLocationCoordinate2D(latitude: 34.3917, longitude: -118.5426)) {
                    MapAnnotationView(number: "8")
                }
                Annotation("San Fernando", coordinate: CLLocationCoordinate2D(latitude: 34.2819, longitude: -118.4390)) {
                    MapAnnotationView(number: "3D")
                }
                Annotation("Glendale", coordinate: CLLocationCoordinate2D(latitude: 34.1425, longitude: -118.2551)) {
                    MapAnnotationView(number: "4")
                }
                Annotation("Pasadena", coordinate: CLLocationCoordinate2D(latitude: 34.1478, longitude: -118.1445)) {
                    MapAnnotationView(number: "12")
                }
                Annotation("Anaheim", coordinate: CLLocationCoordinate2D(latitude: 33.8366, longitude: -117.9143)) {
                    MapAnnotationView(number: "3D")
                }
                Annotation("Long Beach", coordinate: CLLocationCoordinate2D(latitude: 33.7701, longitude: -118.1937)) {
                    MapAnnotationView(number: "8")
                }
                Annotation("Santa Ana", coordinate: CLLocationCoordinate2D(latitude: 33.7455, longitude: -117.8677)) {
                    MapAnnotationView(number: "3D")
                }
                Annotation("Riverside", coordinate: CLLocationCoordinate2D(latitude: 33.9534, longitude: -117.3962)) {
                    MapAnnotationView(number: "2")
                }
            }
            .mapControls {
//                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .ignoresSafeArea()
            
//            VStack(spacing: 0) {
//                // Glass header area with hard edge
//                VStack {
//                    HeaderView(selectedSegment: $selectedSegment, segments: segments)
//                        .padding(.horizontal, 24)
//                        .padding(.top, 16)
//                }
//                .frame(height: headerHeight)
//                .frame(maxWidth: .infinity)
//                .background(
//                    Rectangle()
//                        .fill(.thinMaterial)
//                        .ignoresSafeArea(edges: .top)
//                )
//                .overlay(
//                    // Hard line at the bottom
//                    Rectangle()
//                        .fill(Color.primary.opacity(0.2))
//                        .frame(height: 1)
//                        .frame(maxWidth: .infinity),
//                    alignment: .bottom
//                )
//
//                
//                Spacer()
//            }
//            
//            // Left sidebar with search and recent locations (similar to reference)
//            HStack {
//                SidebarView(headerHeight: headerHeight)
////                    .frame(maxWidth: 400)
////                    .background(Color.clear)
//                
//                Spacer()
//            }
        }
    }
}
