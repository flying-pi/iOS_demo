//
//  CircledView.swift
//  ImageCircled
//
//  Created by Yura Braiko on 02.03.17.
//  Copyright © 2017 Yura Braiko. All rights reserved.
//

import UIKit

class CircledView: UIView {
    
    var image:UIImage! = nil
    var faceted:FacetedItem! = nil
    
    override func draw(_ rect: CGRect) {
//        if image != nil {
//            image.draw(at: CGPoint(x:0,y:0))
//        }
        if faceted != nil {
            faceted.draw()
        }
        
    }
    
    func cropImage(image:UIImage, toRect rect:CGRect) -> UIImage{
        let imageRef:CGImage = image.cgImage!.cropping(to: rect)!
        let croppedImage:UIImage = UIImage(cgImage:imageRef)
        return croppedImage
    }
    
    func setImage(image :UIImage) {
        let k1 = (frame.size.width/image.size.width)
        let k2 = (frame.size.height/image.size.height)
        let k = (k1>k2 ? k1:k2)
        
        let newSize = CGSize(width: image.size.width*k, height: image.size.height*k)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        let scaledRect = CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height))
        image.draw(in: scaledRect)
        
        let cropSize = CGRect(origin: CGPoint(x: (scaledRect.width-frame.size.width)/2,
                                              y: (scaledRect.height-frame.size.height)/2), size: frame.size)
        
        
        self.image = cropImage( image: UIGraphicsGetImageFromCurrentImageContext()! , toRect: cropSize);
        UIGraphicsEndImageContext()
        
        faceted = FacetedItem(image: self.image)
        self.setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(touches.count == 0)
        {
            return;
        }
        if(faceted == nil)
        {
            return;
        }
        for touch in touches {
            faceted.touch(touch.location(in: self))
        }
        self.setNeedsDisplay()

        
        
    }
    
}
