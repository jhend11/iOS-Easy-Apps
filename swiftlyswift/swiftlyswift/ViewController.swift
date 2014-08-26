//
//  ViewController.swift
//  swiftlyswift
//
//  Created by JOSH HENDERSHOT on 8/16/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

//var button2 = UIButton.buttonWithType(UIButtonType.System) as UIbutton



class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer? = nil

    @IBOutlet weak var button1: UIButton!
                            
    @IBOutlet weak var button2: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button2.backgroundColor = UIColor.redColor()
        button2.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: AnyObject)
    {
        println("button tapped")
        func createChaChingSound() -> SystemSoundID {
            var soundID: SystemSoundID = 0
            let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "everything2", "mp3", nil)
            AudioServicesCreateSystemSoundID(soundURL, &soundID)
            //    CFRelease(soundURL)
            return soundID
        }
    }
    
    func createChaChingSound() -> SystemSoundID {
        var soundID: SystemSoundID = 0
        let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "everything2", "mp3", nil)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        //    CFRelease(soundURL)
        return soundID
    
//    let soundURL = NSBundle.mainBundle().PathForResource(everything2, withExtension: "mp3")
//    var mySound : SystemSoundID = 0
//    AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//    
//    NSString * file = [[NSBundle mainBundle] pathForResource:@"everything2" ofType:@"mp3"];
//    
//    NSData * fileData = [NSData dataWithContentsOfFile:file];
//    
//    audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
//    
//    [audioPlayer play];
//    
//    // Play
//    AudioServicesPlaySystemSound(mySound);
    
    }
}
