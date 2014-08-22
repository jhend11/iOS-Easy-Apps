//
//  ViewController.swift
//  The List (Swift)
//
//  Created by JOSH HENDERSHOT on 8/22/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   let niceArray = ["Helper Robots","Some Humans"]
   let naughtyArray = ["Invading Aliens","Killer Robots","Jaws"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tabBarC = UITabBarController()
        self.view.addSubview(tabBarC.view)
        self.addChildViewController(tabBarC)
        
        
        let niceList = UITableViewController()
        niceList.title = "Nice"
        niceList.tableView.delegate = self
        niceList.tableView.dataSource = self
        niceList.tableView.tag = 0
        niceList.tableView .registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let naughtyList = UITableViewController()
        naughtyList.title = "Naughty"
        naughtyList.tableView.delegate = self
        naughtyList.tableView.dataSource = self
        naughtyList.tableView.tag = 1
        naughtyList.tableView .registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tabBarC.viewControllers = [niceList, naughtyList]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return (Bool(tableView.tag)) ? naughtyArray.count : niceArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let itemArray = (Bool(tableView.tag)) ? naughtyArray : niceArray
        cell.textLabel.text = itemArray[indexPath.row]
        
        return cell
    }
   


}

