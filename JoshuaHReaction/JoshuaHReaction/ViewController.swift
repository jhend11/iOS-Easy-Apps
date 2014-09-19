//
//  ViewController.swift
//  JoshuaHReaction
//
//  Created by JOSH HENDERSHOT on 9/18/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import GameKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController {
    
    var timerBar = UIView()
    
    var buttons = [UIButton(), UIButton(), UIButton()]
    
    var scoreLabel = UILabel()
    
    var timer = NSTimer?()
    
//    var timer2 = NSTimer()
//    var startTime = NSTimeInterval()
    
    var date1 = NSDate()
    
    var reactionTime = Double()
    
    var currentScore = 0
    
    var buttonToTap = 0
    
    var player: GKLocalPlayer = GKLocalPlayer.localPlayer()
    
    var allLeaderboards: [String:GKLeaderboard] = Dictionary()
    
    
    // jo showing me how to get the reaction time
//    var startReactionTime: NSDate!
//    var endReactionTime: NSDate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        
        
        
        // first color
        var topColor = UIColor(red: 0.910, green: 0.976, blue: 0.333, alpha: 1.0)
        // second color
        var bottomColor = UIColor(red: 0.973, green: 0.204, blue: 0.333, alpha: 1.0)
        // array of colors in gradient
        var gradientColors: [AnyObject] = [topColor.CGColor, bottomColor.CGColor]
        // array of locations for colors in gradient
        var gradientLocations = [0.0, 1.0]
        // gradient layer
        var gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        
        gradientLayer.startPoint = CGPointMake(0.6, -0.3)
        gradientLayer.endPoint = CGPointMake(0.4, 1.1)
        
        // add colors to gradient layer
        gradientLayer.colors = gradientColors
        // add locations to gradient layer
        gradientLayer.locations = gradientLocations
        // add gradient to view layer as background
        self.view.layer.addSublayer(gradientLayer)
        
        for i in 0..<buttons.count {
            
            var button = buttons[i]
            
            var size: CGFloat = 100
            
            var x = (SCREEN_WIDTH / 2.0) - (size / 2.0)
            var y = (SCREEN_HEIGHT / 2.0) - (size / 2.0) + (CGFloat(i - 1) * (size + 20))
            
            button.alpha = 0.6
            button.frame = CGRectMake(x, y, size, size)
            button.layer.cornerRadius = size / 2.0
            button.backgroundColor = UIColor.whiteColor()
            button.tag = i
            
            button.addTarget(self, action: Selector("buttonTapped:"), forControlEvents: .TouchUpInside)
            
            self.view.addSubview(button)
            
            scoreLabel.frame = CGRectMake(10, 180, 90, 40)
            scoreLabel.backgroundColor = UIColor.lightGrayColor()
            self.view.addSubview(scoreLabel)
            
            println(button)
            
        }
        
        timerBar.backgroundColor = UIColor.whiteColor()
        timerBar.frame = CGRectMake(0, 0, 0, 20)
        self.view.addSubview(timerBar)
        
        
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
        
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            
            self.runLevel()
        }
        
        var nC = NSNotificationCenter.defaultCenter()
        nC.addObserver(self, selector: Selector("authChanged"), name: GKPlayerAuthenticationDidChangeNotificationName, object: nil)
        
        if player.authenticated == false {
            player.authenticateHandler = {(viewController,error) -> Void in
                
                if viewController != nil {
                    
                    self.presentViewController(viewController, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    func resetTimerwithSpeed(speed: Double) {
        
        if timer != nil { timer!.invalidate() }
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: Selector("timerDone"), userInfo: nil, repeats: false)
        

        timerBar.layer.removeAllAnimations()
        timerBar.frame.size.width = SCREEN_WIDTH
        
        UIView.animateWithDuration(speed, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            
            self.timerBar.frame.size.width = 0
            
            }) { (succeeded:Bool) -> Void in
                
        }
    }
    
    func timerDone() {
        println("Game Over")
    }
    
    func buttonTapped(button: UIButton) {
        
        println(button.tag)
        
        if buttonToTap == button.tag {
            
//            timer2.invalidate()
            
            
            // more Jo showing me how to get reaction time
//            endReactionTime = NSDate()
//            let reactionTime1 = endReactionTime.timeIntervalSinceDate(startReactionTime)
//            submitReactionTime(reactionTime1)
            
            var date2 : NSDate = NSDate()
            date2.timeIntervalSinceReferenceDate
            
            var secondsBetween = date2.timeIntervalSinceDate(date1)
            
            scoreLabel.text = NSString(format: "%f", secondsBetween)
            
            reactionTime = secondsBetween
            
            var date3 : NSDate = NSDate()
            date3.timeIntervalSinceReferenceDate
            
            date1 = date3
            
            currentScore++
            
            checkAchievement()

            
            runLevel()
            
            
        } else {
            
            
            submitScore()
            checkAchievement()
            currentScore = 0
            println("Fail")
            var time = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
            
            dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                self.runLevel()
            }
        }
    }
    
    func runLevel() {
        
//        let aSelector : Selector = "updateTime"
//        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
//        startTime = NSDate.timeIntervalSinceReferenceDate()
        
        
        
        
        // jo showing me reaction time
//        startReactionTime = NSDate()
        
        
        
        
        date1.timeIntervalSinceReferenceDate

        
        
        buttonToTap = Int(arc4random_uniform(3))
        
        var button = buttons[buttonToTap]
        
        button.alpha = 1.0
        
        UIView.animateWithDuration(1.0, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            
            button.alpha = 0.6
            
            }) { (succeeded:Bool) -> Void in
                
        }
        
        resetTimerwithSpeed(10)
    }
    
    func authChanged() {
        
        if player.authenticated == false {return}
        
        GKLeaderboard.loadLeaderboardsWithCompletionHandler { (leaderboards, error) -> Void in
            
            
            for leaderboard in leaderboards as [GKLeaderboard] {
                
                var identifier = leaderboard.identifier
                
                self.allLeaderboards[identifier] = leaderboard
                
            }
        }
    }
    
    func submitScore() {
        
        var scoreReporter = GKScore(leaderboardIdentifier: "total_taps")
        scoreReporter.value = Int64(currentScore)
        scoreReporter.context = 0
        
        GKScore.reportScores([scoreReporter], withCompletionHandler: { (error) -> Void in
            println("scores uploaded")
        })
        
        var scoreReporter1 = GKScore(leaderboardIdentifier: "fastest_reaction_time")
        scoreReporter1.value = Int64(reactionTime * 1000)
        scoreReporter1.context = 0
        GKScore.reportScores([scoreReporter1], withCompletionHandler: { (error) -> Void in
            println("reaction time scores uploaded")

        })
        
    }
    
    func checkAchievement() {
        
        if currentScore >= 5 {
         var score50 = GKAchievement(identifier: "score_50")
            score50.percentComplete = 100.0
            score50.showsCompletionBanner = true
            GKAchievement.reportAchievements([score50], withCompletionHandler: { (error) -> Void in
                
                println("achievement sent")
            })
        }
        
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // even more Jo showing me how to submit reaction times
//    func submitReactionTime(time: NSTimeInterval) {
//        
//        var scoreReporter1 = GKScore(leaderboardIdentifier: "fastest_reaction_time")
//        scoreReporter1.value = Int64(time * 1000)
//        scoreReporter1.context = 0
//        GKScore.reportScores([scoreReporter1], withCompletionHandler: { (error) -> Void in
//            println("reaction time scores uploaded")
//            
//        })
//    }
    /*
    func updateTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = (currentTime - startTime)
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
//        scoreLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    */
}

