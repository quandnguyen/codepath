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
    @IBOutlet weak var laterIconView: UIImageView!
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet var bgColorView: UIView!
    @IBOutlet var rescheduleView: UIImageView!
    @IBOutlet var listView: UIImageView!
    @IBOutlet var listIconView: UIImageView!
    @IBOutlet var deleteIconView: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!

    let grayColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    let yellowColor = UIColor(red: 255/255.0, green: 195/255.0, blue: 0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 56/255.0, green: 142/255.0, blue: 60/255.0, alpha: 1.0)
    let redColor = UIColor(red: 198/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 33/255.0, green: 150/255.0, blue: 243/255.0, alpha: 1.0)

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

    

    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        
        
        if sender.state == .began {
            messageOriginalCenter = messageView.center
            
            print("Gesture began")
        } else if sender.state == .changed {
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            print (translation.x)
            
            if translation.x < -260 {
                self.bgColorView.backgroundColor = self.blueColor
            } else {
                if translation.x < -60 {
                    self.bgColorView.backgroundColor = self.yellowColor
                } else {
                    if translation.x > 260 {
                        self.bgColorView.backgroundColor = self.redColor
                        
                        print ("red")
                    } else {
                        if translation.x > 60 {
                            self.bgColorView.backgroundColor = self.greenColor
                            
                            print ("green")

                        } else {
                            self.bgColorView.backgroundColor = self.grayColor
                            
                        }
                    }
                }
            }
        } else if sender.state == .ended {
            var velocity = sender.velocity(in: view)
            
            //panning message to the left
            if translation.x < -260 {
                //the icon should change to the list icon and the background color should change to blue
                
                //Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.
                UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.messageView.center = self.messageLeft
                    }, completion: nil)
            } else {
                if translation.x < -60 {
                    //the later icon should start moving with the translation and the background should change to yellow.
                    //Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
                    UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                   animations: { () -> Void in
                                    self.messageView.center = self.messageLeft
                                    
                        }, completion: nil)
                    UIView.animate(withDuration:0.8, delay:0, animations: {
                                    
                            self.rescheduleView.alpha = 1
                        })

                    
                } else {
                    if translation.x > 60 {
                        //After 60 pts, the archive icon should start moving with the translation and the background should change to green.
                        //Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
                        UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                        animations: { () -> Void in
                                        self.messageView.center = self.messageRight
                            }, completion: nil)
                        UIView.animate(withDuration:0.8, delay:0, animations: {
                                    
                            self.listView.alpha = 1
                        })
                                
                    } else {
                        if translation.x > 260 {
                            //After 260 pts, the icon should change to the delete icon and the background color should change to red.
                            //Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.
                            UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                            animations: { () -> Void in
                                            self.messageView.center = self.messageRight
                                }, completion: nil)
                        } else {
                            //Initially, the revealed background color should be gray.
                                    
                            // If released at this point, the message should return to its initial position.
                            UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                            animations: { () -> Void in
                                            self.messageView.center = self.messageCenter
                                }, completion: nil)
                        }
                    }
                }
            }
            print("Gesture ended")
        }
        
    }


    @IBAction func didTapReschedule(_ sender: UITapGestureRecognizer) {
        self.rescheduleView.alpha = 0
        UIView.animate(withDuration:0.4,
                       animations: { () -> Void in
                        self.messageView.center = self.messageCenter
            }, completion: nil)
    }
    
    
    @IBAction func didTapListOptions(_ sender: UITapGestureRecognizer) {
        self.listView.alpha = 0
        UIView.animate(withDuration:0.4,
                       animations: { () -> Void in
                        self.messageView.center = self.messageCenter
            }, completion: nil)
        
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
