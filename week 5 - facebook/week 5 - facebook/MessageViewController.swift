//
//  MessageViewController.swift
//  week 5 - facebook
//
//  Created by Nguyen, Quan on 10/22/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageview.frame.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
