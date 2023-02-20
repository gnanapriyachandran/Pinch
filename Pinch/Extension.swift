//
//  Extension.swift
//  Pinch
//
//  Created by gnanapriya.chandran on 15/02/23.
//

import Foundation
import SwiftUI

extension CGFloat {
    mutating func togglebetween(_ val1: CGFloat, _ val2: CGFloat) {
        if self == val1{
            withAnimation(.spring()) {
                self = val2
            }
        } else {
            withAnimation(.spring()) {
                self = val1
                
            }
        }
    }
    
}
