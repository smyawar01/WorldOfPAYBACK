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
                    .tint(Color("ObjectPrimary"))
                    .padding()
                Text(NSLocalizedString("Loading...", comment: "Loader text"))
                    .foregroundColor(Color("TextPrimary"))
            }
        }
        .padding()
        .background(Color("ObjectSecondary"))
        .cornerRadius(5)
    }
}

struct CustomLoader_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoader()
    }
}
