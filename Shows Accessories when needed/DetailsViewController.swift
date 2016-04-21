//
//  DetailsViewController.swift
//  Shows Accessories when needed
//
//  Created by mitchell hudson on 4/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var detailsLabel: UILabel!
    
    var detailsText: String! // Implicitly unwrapped optional
    // Why ! ? If we're seeing this view there must be a value here. 
    // When defining the view the value is unavailable.
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        detailsLabel.text = detailsText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
