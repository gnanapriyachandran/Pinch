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
                //MARK: - Tap Gesture
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
                
                //MARK: -Drag Gesture
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
                   
                    
            .ignoresSafeArea()
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
               
            })
            
        }
        //MARK: - Image Scale options
        .overlay(alignment: .top, content: {
            InfoPanelView(scale: imageScale, offset: imageOffset)
               // .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: UIScreen.main.bounds.size.height, alignment: .top)
                .padding(.horizontal)
                .padding(.top,30)
                
        })
        
        //MARK: - Controls
        
        .overlay(alignment: .bottom) {
            Group(content: {
                HStack {
                   
                    //MARK: - Scale down
                    Button {
                        withAnimation(.spring()) {
                            if imageScale > 1 {
                                imageScale -= 1
                            } else {
                                 resetImagestate()
                            }
                        }
                    } label: {
                        ControlImageView(imageName: "minus.magnifyingglass").font(.system(size: 36))
                    }
                    //MARK: - Reset
                    
                    Button {
                        withAnimation(.spring()) {
                                 resetImagestate()
                        }
                    }label: {
                        ControlImageView(imageName: "arrow.up.left.and.down.right.magnifyingglass")
                    }
                    //MARK: - Scale up
                    Button {
                        if imageScale < 5 {
                            imageScale += 1
                        } else  {
                            imageScale = 5
                        }
                    }label: {
                        ControlImageView(imageName: "plus.magnifyingglass")
                    }
                }
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimating ? 1:0)
            })
                .padding(30)
               
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
