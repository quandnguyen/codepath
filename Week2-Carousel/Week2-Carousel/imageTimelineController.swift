//
//  imageTimelineController.swift
//  Week2-Carousel
//
//  Created by Nguyen, Quan on 10/2/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class imageTimelineController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
 
    @IBOutlet weak var settingsButton: UIButton!

    @IBOutlet weak var conversationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.image!.size
        
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
