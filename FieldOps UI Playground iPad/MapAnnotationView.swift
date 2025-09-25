//
//  MapAnnotationView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI

struct MapAnnotationView: View {
    let number: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 32, height: 32)
            
            Text(number)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
        }
    }
}