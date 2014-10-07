//
//  CameraViewController.swift
//  Cirrus
//
//  Created by JOSH HENDERSHOT on 10/4/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//



import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    
    // our global session
    private let captureSession = AVCaptureSession()
    // the camera, if found
    private var captureDevice : AVCaptureDevice?
    // which camera
    private var cameraPosition = AVCaptureDevicePosition.Back
    // JPEG output
    private var stillImageOutput : AVCaptureStillImageOutput?
    // preview layer
    private var previewLayer : AVCaptureVideoPreviewLayer?
    // dropbox rest client
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        if findCamera(cameraPosition) {
            // start session
            beginSession()
        } else {
            // show sad error
        }
        
    }
    
    @IBAction func rewindFromSegue(segue:UIStoryboardSegue) {
        println("User aborted sending a photo")
    }
    
    @IBAction func sendPhoto(segue:UIStoryboardSegue) {
        println("Sending photo")
        
        let (fileName, snapFileName) = CameraViewController.getSnapFileName()
        let friendsViewController = segue.sourceViewController as FriendsViewController
        
        // Upload photo
        
    }
    
    func findCamera(position : AVCaptureDevicePosition) -> Bool {
        
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        
        for device in devices {
            if device.position == position {
                captureDevice = device as? AVCaptureDevice
            }
        }
        
        return captureDevice != nil
        
    }
    
    func beginSession() {
        var err : NSError? = nil
        
        let videoCapture = AVCaptureDeviceInput(device: captureDevice, error: &err)
        
        if err != nil {
            println("Capture session could not start: \(err?.description)")
            return
        }
        
        if captureSession.canAddInput(videoCapture) {
            captureSession.addInput(videoCapture)
        }
        
        if !captureSession.running {
            // set JPEG output
            stillImageOutput = AVCaptureStillImageOutput()
            let outputSettings = [ AVVideoCodecKey : AVVideoCodecJPEG ]
            stillImageOutput!.outputSettings = outputSettings
            
            // add output to session
            if captureSession.canAddOutput(stillImageOutput) {
                captureSession.addOutput(stillImageOutput)
            }
            
            // display camera in UI
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            cameraView.layer.addSublayer(previewLayer)
            previewLayer?.frame = cameraView.layer.frame
            previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            // start camera
            captureSession.startRunning()
        }
    }
    
    
    
    @IBAction func flipCamera(sender: UIButton) {
        // Flip the camera
        
        // when session is running to make change you must...
        captureSession.beginConfiguration()
        // find and remove input
        let currentInput = captureSession.inputs[0] as AVCaptureInput
        captureSession.removeInput(currentInput)
        
        // toggle camera (if this then that if not then that)
        cameraPosition = cameraPosition == .Back ? .Front : .Back
        
        // find other camera
        if findCamera(cameraPosition) {
            beginSession()
        } else {
            // show sad panda
        }
        
        // commit changes
        captureSession.commitConfiguration()
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        if let stillOutput = self.stillImageOutput {
            
            // we do this on another thread so we don't hang the UI
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                
                // find video connection
                var videoConnection : AVCaptureConnection?
                for connection in stillOutput.connections {
                    // find a matching input port
                    for port in connection.inputPorts! {
                        // and matching type
                        if port.mediaType == AVMediaTypeVideo {
                            videoConnection = connection as? AVCaptureConnection
                            break
                        }
                    }
                    if videoConnection != nil {
                        break // for connection
                    }
                }
                
                if videoConnection != nil {
                    // found the video connection, let's get the image
                    stillOutput.captureStillImageAsynchronouslyFromConnection(videoConnection) {
                        (imageSampleBuffer:CMSampleBuffer!, _) in
                        
                        let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageSampleBuffer)
                        self.didTakePhoto(imageData)
                    }
                }
            }
        }
    }
    
    class func getSnapFileName() -> (String, String) {
        let fileName = "lastSnap.jpg"
        let tmpDirectory = NSTemporaryDirectory()
        let snapFileName = tmpDirectory.stringByAppendingPathComponent(fileName)
        
        return (fileName, snapFileName)
    }
    
    func didTakePhoto(imageData: NSData) {
        // parse not dropbox
        let image = UIImage(data: imageData)
        let compressedImage = compressImage(image)
        let (_, fullFileName) = CameraViewController.getSnapFileName()
        compressedImage.writeToFile(fullFileName, atomically: true)
        
        // Show the preview window ..
        var sendNav = self.storyboard?.instantiateViewControllerWithIdentifier("SendNav") as UIViewController!
        self.presentViewController(sendNav, animated: true, completion: nil)
        
        /*
        // Example 1: if you want to show thumbnail
        let image = UIImage(data: imageData)
        let compressedImage = compressImage(image)
        
        // Example 2: if you want to save image
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let prefix: String = formatter.stringFromDate(NSDate())
        let fileName = "\(prefix).jpg"
        
        let tmpDirectory = NSTemporaryDirectory()
        let snapFileName = tmpDirectory.stringByAppendingPathComponent(fileName)
        compressedImage.writeToFile(snapFileName, atomically: true)
        
        // upload to dropbox
        dbRestClient?.uploadFile(fileName, toPath: "/", withParentRev: nil, fromPath: snapFileName)
        */
        
        
        
    }

    
    func compressImage(image:UIImage) -> NSData {
        
        var actualHeight : CGFloat = image.size.height
        var actualWidth : CGFloat = image.size.width
        var maxHeight : CGFloat = 1136.0
        var maxWidth : CGFloat = 640.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        var maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.5
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if(imgRatio > maxRatio){

                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else{
                actualHeight = maxHeight;
                actualWidth = maxWidth;
            }
        }
        
        var rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
        UIGraphicsBeginImageContext(rect.size);
        image.drawInRect(rect)
        var img = UIGraphicsGetImageFromCurrentImageContext();
        let imageData = UIImageJPEGRepresentation(img, compressionQuality);
        UIGraphicsEndImageContext();
        
        return imageData;
    }
}

