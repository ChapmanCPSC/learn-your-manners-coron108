//
//  EmailViewController.swift
//  Manners App
//
//  Created by Daniel Corona on 4/22/16.
//  Copyright © 2016 Danny Corona. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefaults = NSUserDefaults()
        self.emailTextField.text = userDefaults.stringForKey("userEmail")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(candidate)
    }

    @IBAction func donePressed(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if validateEmail(emailTextField.text!) == true
        {
            userDefaults.setObject(emailTextField.text, forKey: "userEmail")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
            
        else
        {
            let alertController = UIAlertController(title: "Not a valid email", message: "Try again", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
