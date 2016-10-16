//
//  ComposeViewController.swift
//  Week 4 - Tumblr
//
//  Created by Nguyen, Quan on 10/12/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var composeButtons: [UIButton]!
    
    var composeButtonsOriginalCenter: CGPoint!
    var composeButtonsOffset: CGFloat!
    var composeButtonsCenter: CGPoint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        composeButtonsOffset = 100
//        composeButtonsCenter = composeButtons.center
//        
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse],
//                       animations: {
//                        self.composeButtons.center = self.frame.size.heigth + composeButtonsOffset
//                    
//            }, completion: nil)
//
//        
//    }
    
    @IBAction func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
