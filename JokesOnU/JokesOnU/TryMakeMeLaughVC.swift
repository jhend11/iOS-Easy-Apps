//
//  TryMakeMeLaughVC.swift
//  JokesOnU
//
//  Created by Heidi Proske on 10/7/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

enum JokeType: Int {
    case All
    case Nerdy
    case Explicit
}

class TryMakeMeLaughVC: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var jokeTypeSegment: UISegmentedControl!
    var currentJoke: Joke!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeLabel.layer.borderWidth = 5
        jokeLabel.layer.borderColor = UIColor.greenColor().CGColor
    }
    
    @IBAction func saveCurrentJokeToParse(sender: AnyObject) {
        
        
        let parseJoke = PFObject(className: "Jokes")
        
        parseJoke.setObject(currentJoke.jokeText, forKey: "text")
        parseJoke.setObject(currentJoke.id, forKey: "id")
        parseJoke.setObject(currentJoke.categories, forKey: "categories")
        parseJoke.setObject(PFUser.currentUser(), forKey: "owner")
//        parseJoke.setObject(PFUser.currentUser().objectId, forKey: "owner2")

        
        println(PFUser.currentUser())
        println("Adding PFObject \(parseJoke)")

        
        parseJoke.saveInBackgroundWithBlock { (success, error) -> Void in
            
            if error != nil {
                println("Whoops, an error occurred while trying to save a joke \(error.userInfo)")
                return
            }
            
            NSNotificationCenter.defaultCenter().postNotificationName("jokeSaved", object: nil)
        }
        
        
    }
    
    @IBAction func makeEmLaugh(sender: AnyObject) {
        
        let jokeTypeString: String = jokeTypeSegment.titleForSegmentAtIndex(jokeTypeSegment.selectedSegmentIndex)!
        
        var parameters = ""
        switch (jokeTypeString) {
        case "Nerdy":
            println("Nerd alert.... incoming!")
            parameters = "limitTo=[\(jokeTypeString.lowercaseString)]"
            parameters += "&firstName=Heidi&lastName=Proske"
        case "Explicit":
            parameters = "limitTo=[\(jokeTypeString.lowercaseString)]"
            println("Ooooh user wants a naughty joke")
        case "Any":
            println("User isn't interested... pour a glass of water over them!")
        default:
            println("Uhoh, miscategorization - user wants a \(jokeTypeString) type joke")
        }
        
        JokesApiRequest.newJoke("random", parameters: parameters) { (joke) -> Void in
            self.currentJoke = joke
            self.jokeLabel.text = joke.jokeText
        }
        
        
    }
}

