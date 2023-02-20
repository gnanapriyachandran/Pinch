//
//  InfoPanelView.swift
//  Pinch
//
//  Created by gnanapriya.chandran on 17/02/23.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    var body: some View {
        HStack {
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    isInfoPanelVisible.toggle()
                }
            Spacer()
            //MARK: - Info Panel View
            HStack(spacing: 2) {
                Spacer()
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(Double(scale), specifier: "%.2f")")
                   // .frame(width: 30, height: 30)
                    .lineLimit(0)
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(Double(offset.width),  specifier: "%.2f")")
                  //  .frame(width: 30, height: 30)
                    .lineLimit(0)
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(Double(offset.height),  specifier: "%.2f")")
                   // .frame(width: 30, height: 30)
                    .lineLimit(0)
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1:0)
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
