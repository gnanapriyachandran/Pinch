//
//  ControlImageView.swift
//  Pinch
//
//  Created by GNANAM on 14/06/23.
//

import SwiftUI

struct ControlImageView: View {
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 30))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(imageName: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
