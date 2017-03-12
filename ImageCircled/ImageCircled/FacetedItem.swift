//
//  FacetedItem.swift
//  ImageCircled
//
//  Created by Yura Braiko on 04.03.17.
//  Copyright © 2017 Yura Braiko. All rights reserved.
//

import Foundation
import UIKit

class FacetedItem{
    private var subItems = [FacetedItem]();
    //pixels info of full image
    private let data: UnsafePointer<UInt8>
    //size of original image
    private let w:Int;
    private let h:Int;
    
    //aria of this element
    private let rect:CGRect;
    
    private var avarageColor : UIColor = UIColor();
    private let bpath:UIBezierPath ;
    
    
    public init(image: UIImage){
        let pixelData = image.cgImage!.dataProvider!.data
        data = CFDataGetBytePtr(pixelData)
        w = Int(image.size.width)
        h = Int(image.size.height)
        rect = CGRect( origin: CGPoint(x: 0, y: 0),size: CGSize(width: w, height: h))
//        bpath = UIBezierPath(rect: rect)
        bpath = UIBezierPath(ovalIn: rect)
        avarageColor = getAvarageColor(data)
    }
    
    private init(pixels : UnsafePointer<UInt8>, width: Int, heigth: Int, rectangle :CGRect){
        data = pixels;
        w = width
        h = heigth
        rect = rectangle
//        bpath = UIBezierPath(rect: rect)
        bpath = UIBezierPath(rect: rect)
        avarageColor = getAvarageColor(data)
        avarageColor = getAvarageColor(data)
    }
    
    private func pixel(x:Int,y:Int)->Int{
        return (w*y + x) * 4;
    }
    
    private func getAvarageColor(_ avarage: UnsafePointer<UInt8>) -> UIColor{
        var r:Float64 = 0;
        var g:Float64 = 0;
        var b:Float64 = 0;
        
//       let newAvarage: UnsafePointer<UInt8>
    
        
//        for i in 0.stride(to: avarage., by: 2) {
//            // Do something
//        }
        
        for x in Int(rect.origin.x)...Int(rect.origin.x+rect.width) {
            for y in Int(rect.origin.y)...Int(rect.origin.y+rect.height) {
                let pixelInfo=pixel(x: x,y: y)
                r = Float64(data[pixelInfo]) / Float64(255.0)
                g = Float64(data[pixelInfo+1]) / Float64(255.0)
                b = Float64(data[pixelInfo+2]) / Float64(255.0)
                //                a += Float64(data[pixelInfo+3]) / Float64(255.0)
                
            }
        }
//        let count  = Float64(Int(rect.width)*Int(rect.height));
        let count  = Float64(1);
        return UIColor(red: CGFloat(r/count), green: CGFloat(g/count), blue: CGFloat(b/count), alpha:1);
    }
    
    public func draw(){
        if(subItems.count == 0){
            avarageColor.set()
            bpath.fill()
            return
        }
        for x in subItems {
            x.draw()
        }
    }
    
    public func touch(_ touch: CGPoint){
        if(touch.x<rect.origin.x || touch.x>(rect.origin.x+rect.width) || touch.y<rect.origin.y || touch.y>(rect.origin.y+rect.height)){
            return;
        }
        if subItems.count == 0 {
            split()
        }else{
            for x in subItems {
                x.touch(touch)
            }
            
        }
    }
    
    private func split(){
        subItems.append(FacetedItem(pixels: self.data,width: w,heigth: h,rectangle: CGRect(
            origin: CGPoint(x: rect.origin.x, y: rect.origin.y)
            ,size: CGSize(width: rect.width/2, height: rect.height/2))))
        
        subItems.append(FacetedItem(pixels: self.data,width: w,heigth: h,rectangle: CGRect(
            origin: CGPoint(x: rect.origin.x+rect.width/2, y: rect.origin.y)
            ,size: CGSize(width: rect.width/2, height: rect.height/2))))
        
        subItems.append(FacetedItem(pixels: self.data,width: w,heigth: h,rectangle: CGRect(
            origin: CGPoint(x: rect.origin.x, y: rect.origin.y+rect.height/2)
            ,size: CGSize(width: rect.width/2, height: rect.height/2))))
        
        subItems.append(FacetedItem(pixels: self.data,width: w,heigth: h,rectangle: CGRect(
            origin: CGPoint(x: rect.origin.x+rect.width/2, y: rect.origin.y+rect.height/2)
            ,size: CGSize(width: rect.width/2, height: rect.height/2))))
    }
    
    
}
