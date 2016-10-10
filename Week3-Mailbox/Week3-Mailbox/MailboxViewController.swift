//
//  MailboxViewController.swift
//  Week3-Mailbox
//
//  Created by Nguyen, Quan on 10/5/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var messageView: UIView!

    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 375, height: 1500)
        
        messageOffset = 375
        messageCenter = messageView.center
        messageLeft = CGPoint(x: messageView.center.x - messageOffset,y: messageView.center.y)
        messageRight = CGPoint(x: messageView.center.x + messageOffset,y: messageView.center.y)
        
    
        

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            messageOriginalCenter = messageView.center
            print("Gesture began")
        } else if sender.state == .changed {
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            print("Gesture is changing")
        } else if sender.state == .ended {
            var velocity = sender.velocity(in: view)
            
            //panning message to the left
            if velocity.x < -260 {
                //the icon should change to the list icon and the background color should change to brown
                
                //Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.
                
            } else {
                if velocity.x < -60 {
                    //the later icon should start moving with the translation and the background should change to yellow.
                    //Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
                    
                } else {
                    //panning message to the right
                    if velocity.x < 0 {
                        //Initially, the revealed background color should be gray.
                        
                        //As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
                        UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                       animations: { () -> Void in
                                        self.messageView.center = self.messageCenter
                            }, completion: nil)
                        print ("pan left")
                        
                    } else {
                        if velocity.x > 0 {
                            //Initially, the revealed background color should be gray.
                            //As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
                            UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                           animations: { () -> Void in
                                            self.messageView.center = self.messageCenter
                                }, completion: nil)
                            print ("pan right")
                            
                        } else {
                            if velocity.x > 60 {
                                //After 60 pts, the archive icon should start moving with the translation and the background should change to green.
                                //Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
                                
                                
                            } else {
                                if velocity.x > 260 {
                                    //After 260 pts, the icon should change to the delete icon and the background color should change to red.
                                    //Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.

                                    
                                }
                            }
                        }
                        
                    }
                    
                    
                    
                    
                    //As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
                    //UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                     //              animations: { () -> Void in
                     //               self.messageView.center = self.messageCenter
                     //   }, completion: nil)
                    
                }
            }

            print("Gesture ended")
        }
        
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
