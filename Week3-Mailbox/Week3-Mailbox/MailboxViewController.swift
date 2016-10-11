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
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var containerView: UIView!

    
    
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    
    var feedViewOriginalCenter: CGPoint!
    var feedViewOffset: CGFloat!
    var feedViewCenter: CGPoint!
    var feedViewTop: CGPoint!
    
    var containerOriginalCenter: CGPoint!
    var containerOffset: CGFloat!
    var containerLeft: CGPoint!
    var containerRight: CGPoint!
    
    
    

    

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
        
        feedViewCenter = feedView.center

        containerOffset = 330
        containerLeft = containerView.center
        containerRight = CGPoint(x: containerView.center.x + containerOffset, y: containerView.center.y)
        
        
        let screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didScreenEdgePan(sender:)))
        
        // Configure the screen edges you want to detect.
        screenEdgePanGestureRecognizer.edges = UIRectEdge.left
        
        // Attach the screen edge pan gesture recognizer to some view.
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(screenEdgePanGestureRecognizer)
        
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
                listIconView.center.x = messageView.frame.origin.x + messageView.frame.size.width + 30
                listIconView.alpha = 1
                laterIconView.alpha = 0
                archiveIconView.alpha = 0
                deleteIconView.alpha = 0
            } else {
                if translation.x < -60 {
                    self.bgColorView.backgroundColor = self.yellowColor
                    laterIconView.center.x = messageView.frame.origin.x + messageView.frame.size.width + 30
                    listIconView.alpha = 0
                    laterIconView.alpha = 1
                    archiveIconView.alpha = 0
                    deleteIconView.alpha = 0
                    
                } else {
                    if translation.x > 260 {
                        self.bgColorView.backgroundColor = self.redColor
                        deleteIconView.center.x = messageView.frame.origin.x - 30
                        listIconView.alpha = 0
                        laterIconView.alpha = 0
                        archiveIconView.alpha = 0
                        deleteIconView.alpha = 1
                        print ("red")
                    } else {
                        if translation.x > 60 {
                            self.bgColorView.backgroundColor = self.greenColor
                            archiveIconView.center.x = messageView.frame.origin.x - 30
                            listIconView.alpha = 0
                            laterIconView.alpha = 0
                            archiveIconView.alpha = 1
                            deleteIconView.alpha = 0
                            
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
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }


    @IBAction func didTapReschedule(_ sender: UITapGestureRecognizer) {
        self.rescheduleView.alpha = 0
        UIView.animate(withDuration:0.4, delay: 0, options: [], animations: {

            self.feedView.center.y -= self.bgColorView.frame.height
            }, completion: nil)
        UIView.animate(withDuration:0.4, delay: 0.4, options: [], animations: {
            
            self.feedView.center.y += self.bgColorView.frame.height
            }, completion: nil)
        delay(0.4) {
            self.messageView.center = self.messageCenter
        }

    }
    
    
    @IBAction func didTapListOptions(_ sender: UITapGestureRecognizer) {
        self.listView.alpha = 0
        //UIView.animate(withDuration:0.4, delay: 0, options: [.autoreverse], animations: {
            // different method to animate with the same result
            //}, completion: nil)
        UIView.animate(withDuration:0.4, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.feedView.center.y -= self.bgColorView.frame.height
                        
            }, completion: nil)
        UIView.animate(withDuration:0.4, delay: 0.4, options:[] ,
                       animations: { () -> Void in
                        self.feedView.center.y += self.bgColorView.frame.height
                        
            }, completion: nil)

        delay(0.4) {
            self.messageView.center = self.messageCenter
        }
        
    }
    
    func didScreenEdgePan(sender: UIScreenEdgePanGestureRecognizer) {
        // Do something when the user does a screen edge pan.
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            containerOriginalCenter = containerView.center
            print("Gesture began")
        } else if sender.state == .changed {
            containerView.center = CGPoint(x: containerOriginalCenter.x + translation.x, y: containerOriginalCenter.y)
            
            print("Gesture is changing")
        } else if sender.state == .ended {
            if velocity.x > 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.containerView.center = self.containerRight
                                
                    }, completion: nil)
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.containerView.center = self.containerLeft
                                
                    }, completion: nil)
            }
        
            print("Gesture ended")
        }

    }
   
    @IBAction func didPanContainer(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            containerOriginalCenter = containerView.center
            print("Gesture began")
        } else if sender.state == .changed {
            containerView.center = CGPoint(x: containerOriginalCenter.x + translation.x, y: containerOriginalCenter.y)
            
            print("Gesture is changing")
        } else if sender.state == .ended {
            if velocity.x < 0 {
                UIView.animate(withDuration:0.4, delay: 0, options:[] ,
                               animations: { () -> Void in
                                self.containerView.center = self.containerLeft
                                
                    }, completion: nil)
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.containerView.center = self.containerRight
                                
                    }, completion: nil)
                
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
