//
//  ViewController.swift
//  Manners App
//
//  Created by Daniel Corona on 4/14/16.
//  Copyright © 2016 Danny Corona. All rights reserved.
//

import MessageUI
import UIKit

class ViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var sendSummaryText: UIBarButtonItem!
    
    var m : [Manners] = [
        Manners(mannerName: "Eye Contact", description: "To maintain appropriate eye contact without staring, you should maintain eye contact for 50 percent of the time while speaking and 70% of the time while listening. This helps to display interest and confidence.", mannerImage: UIImage(named: "eyeContact")),
            Manners(mannerName: "Sneezing", description: "Cover your mouth and nose while sneezing to prevent the spread of germs. Use a tissue when possible, but you can also use your elbow.", mannerImage: UIImage(named: "sneeze")),
            Manners(mannerName: "Eating", description: "Chew with your mouth closed and do not talk when your mouth is full. Keep a napkin on your lap; use it to wipe your mouth when necessary.", mannerImage: UIImage(named: "eating")),
            Manners(mannerName: "Phone Skills", description: "When you make a phone call, introduce yourself first and then ask if you can speak with the person you are calling. Do not speak too loudly on the phone when in public areas.", mannerImage: UIImage(named: "talkingOnPhone")),
            Manners(mannerName: "Conversation", description: "Look at the person or people you are talking to. If you haven't met before, introduce yourself and ask their name. Say nice things about people and praise those who deserve it. It's fine to disagree, but disagree politely.", mannerImage: UIImage(named: "talking")),
            Manners(mannerName: "Saying 'Excuse me'", description: "If you do need to get somebody's attention right away, the phrase 'excuse me' is the most polite way for you to enter the conversation.", mannerImage: UIImage(named: "excuseMe")),
            Manners(mannerName: "Please and Thank You", description: "When asking for something, say 'Please. When receiving something, say 'Thank you.' Be especially appreciative and say 'thank you' for any gift you receive.", mannerImage: UIImage(named: "pleaseAndThankYou")),
            Manners(mannerName: "Knocking", description: "Knock on closed doors and wait to see if there's a response before entering.", mannerImage: UIImage(named: "knocking")),
        ]
    
    var itemsClicked : [String] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "detail_view")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let enteredEmail = userDefaults.stringForKey("userEmail")
        
        if (enteredEmail == nil)
        {
            sendSummaryText.title = ""
        }
        
        else
        {
         sendSummaryText.title = "Send Summary"
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.m.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manner = self.m[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detail_view") as! TableViewCell
        cell.initCell(manner)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        if !self.itemsClicked.contains(self.m[indexPath.row].mannerName)
        {
            self.itemsClicked.append(self.m[indexPath.row].mannerName)
        }
    
        let navVC = self.storyboard!.instantiateViewControllerWithIdentifier("detail_view") as! UINavigationController
        
        let detailVC = navVC.viewControllers[0] as! Manners_Detail_View
        detailVC.m = self.m[indexPath.row]
        
        self.presentViewController(navVC, animated: true, completion: nil)
    
    }
    

    @IBAction func sendSummaryPressed(sender: AnyObject) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        let userDefaults = NSUserDefaults()
        var message = ""
        
        composeVC.setToRecipients([userDefaults.stringForKey("userEmail")!])
        composeVC.setSubject("Summary From Manners App")
        
        for item in itemsClicked
        {
            message += "\(item) \n"
        }
        
        composeVC.setMessageBody("Items clicked:\n \(message)", isHTML: false)
        
        if itemsClicked == []
        {
            composeVC.setMessageBody("No items were clicked", isHTML: false)
        }
        

        
        self.presentViewController(composeVC, animated: true, completion: nil)
       
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func settingsPressed(sender: AnyObject) {
        let emailVC = self.storyboard!.instantiateViewControllerWithIdentifier("email_view")
        
        self.presentViewController(emailVC, animated: true, completion: nil)
    }
}

