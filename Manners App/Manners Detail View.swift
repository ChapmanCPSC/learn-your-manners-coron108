//
//  Manners Detail View.swift
//  Manners App
//
//  Created by Daniel Corona on 4/14/16.
//  Copyright © 2016 Danny Corona. All rights reserved.
//

import UIKit

class Manners_Detail_View: UIViewController {
    
    var m : Manners!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.DescriptionLabel.text = m.description
        self.imageView.image = m.mannerImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
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
