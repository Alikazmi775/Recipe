//
//  LoadingView.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("🍔")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the Recipes ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
