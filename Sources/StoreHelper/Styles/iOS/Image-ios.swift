//
//  BodyImage.swift
//  StoreHelper
//
//  Created by Russell Archer on 20/12/2021.
//

import SwiftUI

#if os(iOS) || os(watchOS)
@available(iOS 15.0, watchOS 9, *)
public extension Image {
    
    // Read images from the Sources/Resources folder
    init(packageResource name: String, ofType type: String) {
        #if canImport(UIKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
                  self.init(name)
                  return
              }
        
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path) else {
                  self.init(name)
                  return
              }
        self.init(nsImage: image)
        #else
        self.init(name)
        #endif
    }
    
    func bodyImage() -> some View {
        self
            .resizable()
            .cornerRadius(15)
            .aspectRatio(contentMode: .fit)
    }
    
    func bodyImageNotRounded() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
#endif
