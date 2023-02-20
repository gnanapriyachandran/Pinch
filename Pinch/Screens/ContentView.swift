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
    @State private var imageOffset: CGSize = .zero
    @State private var imageFrame:CGFloat = 0
    let screenSize = UIScreen.main.bounds.size
//MARK: - Function
    func resetImagestate(){
        withAnimation {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    
    //MARK: - Content
    

    
    var body: some View {
        NavigationStack{
            ZStack {
               
                //MARK: - Page image
                Image("magazine-front-cover")
                    .resizable()
                    .onTapGesture(count: 2, perform: {
                        //imageScale.togglebetween(1, 5)
                        
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImagestate()
                            imageFrame = 0
                        }
                        
                    })
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    
                                    //                            if imageScale <= 1 {
                                    //                                withAnimation(.spring()) {
                                    //                                   resetImagestate()
                                    //                                }
                                    //                            } else {
                                    if imageScale != 1 {
                                        imageFrame = 200
                                    }
                                    
                                    imageOffset = value.translation
                                    // }
                                    
                                }
                            })
                            .onEnded({ value in
                                
                                
                                if imageScale <= 1 {
                                    withAnimation(.spring()) {
                                        resetImagestate()
                                        
                                    }
                                }
                                
                                
                            })
                    )
                
                
            }
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding(10)
                    .shadow(color: .black.opacity(0.8), radius: 10)
                    .opacity(isAnimating ? 1:0 )
                    .scaleEffect(imageScale)
                    .frame(maxWidth: UIScreen.main.bounds.size.width-imageFrame, maxHeight: UIScreen.main.bounds.size.height-imageFrame, alignment: .center)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                   
                    
                //MARK: - Tap Gesture
                   
                    //MARK: - Drag Gesture
                    
            .ignoresSafeArea()
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
               
            })
            
        }
        .overlay(alignment: .top, content: {
            InfoPanelView(scale: imageScale, offset: imageOffset)
               // .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: UIScreen.main.bounds.size.height, alignment: .top)
                .padding(.horizontal)
                .padding(.top,30)
                
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
