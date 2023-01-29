//
//  CustomLoader.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

struct CustomLoader: View {
    var body: some View {
        
        ZStack {
            
            VStack {
                
                ProgressView()
                    .tint(Color.white)
                    .padding()
                Text("Loading...")
                    .foregroundColor(Color.white)
            }
        }
        .padding()
        .background(Color.black.opacity(0.9))
        .cornerRadius(5)
    }
}

struct CustomLoader_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoader()
    }
}
