//
//  FloatingWindow.swift
//  FloatingDebug
//
//  Created by Dan Sinclair on 27/07/2016.
//  Copyright © 2016 Dan Sinclair. All rights reserved.
//

import Foundation
import UIKit

class FloatingWindow {
    
    fileprivate var window: UIWindow!
    fileprivate var text: String?
    fileprivate var label: UILabel?
    
    fileprivate var imageName: String?
    fileprivate var imageView: UIImageView?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    convenience init(window: UIWindow, text: String) {
        self.init(window: window)
        self.text = text
        self.label = createLabel()
        
    }
    
    convenience init(window: UIWindow, imageNamed image: String) {
        self.init(window: window)
        self.imageName = image
        self.imageView = createImageView()
    }
    
    // Create a UILabel
    fileprivate func createLabel() -> UILabel {
        
        let label = UILabel()
        label.text = self.text
        label.textColor = UIColor.black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.frame = CGRect(x: 2, y: self.window.bounds.height - 22, width: self.window.bounds.width, height: 20)

        return label
    }
    
    // Create a UIImageView
    fileprivate func createImageView() -> UIImageView {
        
        let imgView = UIImageView(image: UIImage(named: self.imageName!))
        imgView.frame = CGRect(x: 2, y: self.window.bounds.height - 22, width: 20, height: 20)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }
    
    func show() {
        
        #if DEBUG
        if self.text != nil { // Must want a label
            self.label = createLabel()
            self.window.addSubview(self.label!)
            self.window.bringSubview(toFront: self.label!)
            
        } else if self.imageName != nil { // Must want an imageView
            self.imageView = createImageView()
            self.window.addSubview(self.imageView!)
            self.window.bringSubview(toFront: self.imageView!)
        }
        
            self.window.makeKeyAndVisible()
        #endif
    }
    
    func hide() {
        #if DEBUG
            if self.label != nil {
                self.label!.removeFromSuperview()
                self.label = nil
            
            } else if self.imageView != nil {
                self.imageView!.removeFromSuperview()
                self.imageView = nil
            }
        #endif
    }
    
    func setText(_ text: String, andShow show: Bool) {
        self.hide()
        self.imageName = nil

        self.text = text
            
        if show {
            self.show()
        }
    }
    
    func setImage(imageNamed image: String, andShow show: Bool) {
        self.hide()
        self.text = nil
        
        self.imageName = image
        
        if show {            
            self.show()
        }
    }
    
}
