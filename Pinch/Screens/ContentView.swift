//
//  ContentView.swift
//  Pinch
//
//  Created by gnanapriya.chandran on 07/02/23.
//

import SwiftUI

struct ContentView: View {
    
//MARK: - Property
    
    @State private var isAnimating = false
    @State private var imageScale: CGFloat = 1
    
//MARK: - Function
    
    
    
    //MARK: - Content
    

    
    var body: some View {
        NavigationStack{
            ZStack {
                //MARK: - Page image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding(10)
                    .shadow(color: .black.opacity(0.8), radius: 10)
                    .opacity(isAnimating ? 1:0 )
                    .scaleEffect(imageScale)
                //MARK: - Tap Gesture
                    .onTapGesture(count: 2, perform: {
                        imageScale.togglebetween(1, 5)
                        
//                            if imageScale == 1 {
//                                withAnimation(.spring()) {
//                                    imageScale = 5
//                                }
//                            } else {
//                                withAnimation(.spring()) {
//                                    imageScale = 1
//                                }
//                            }
//
                    })
                
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
               
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
