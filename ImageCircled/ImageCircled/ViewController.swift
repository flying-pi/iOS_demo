//
//  ViewController.swift
//  ImageCircled
//
//  Created by Yura Braiko on 22.02.17.
//  Copyright © 2017 Yura Braiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var displayedImage: CircledView!
    var imagePicker: UIImagePickerController!
    
    @IBAction func loadImageClick(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
//
//            self.presentViewController(imagePicker, animated: true, completion: nil)
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        displayedImage.setImage(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

