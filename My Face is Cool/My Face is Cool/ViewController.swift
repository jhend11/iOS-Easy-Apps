//
//  ViewController.swift
//  My Face is Cool
//
//  Created by JOSH HENDERSHOT on 8/20/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!)
    {
    println("i've got an image");
    }
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var takePhoto: UIButton!

    @IBOutlet weak var choosePhotos: UIButton!
    
    
    @IBAction func takePhoto(sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            println("Button capture")
            
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.Camera;
//            imagePicker.mediaTypes = NSArray(object: kUTTypeImage)
            imag.allowsEditing = false
            
            self.presentViewController(imag, animated: true, completion: nil);
        }
    }
    
    @IBAction func choosePhotos(sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            println("Button capture")
            
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            //            imagePicker.mediaTypes = NSArray(object: kUTTypeImage)
            imag.allowsEditing = false
            
            self.presentViewController(imag, animated: true, completion: nil);
        }
    }
}

