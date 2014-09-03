//
//  ViewController.swift
//  My Data
//
//  Created by JOSH HENDERSHOT on 9/2/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appD = UIApplication.sharedApplication().delegate as AppDelegate
        
        var entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: appD.managedObjectContext)

        var postObject = NSEntityDescription.insertNewObjectForEntityForName("Post", inManagedObjectContext: appD.managedObjectContext) as NSManagedObject
        
        postObject.setValue("jo@theironyard.com", forKey: "user")
        postObject.setValue("TITLE!", forKey: "title")
        appD.saveContext()

        
        // fetch
        
        var fetchRequest = NSFetchRequest()
        
        
        fetchRequest.entity = entity
        
        var predicate = NSPredicate(format: "user = 'jo@theironyard.com'")
        
        fetchRequest.predicate = predicate
        
        var sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var fetchedObjects = appD.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil)
        
        println(fetchedObjects)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

