//
//  HamburgerViewController.swift
//  StyleCast
//
//  Created by Kim, YoungKyo (CONT) on 11/6/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var feedViewInitialCenter: CGPoint!
    var feedViewRight: CGPoint!
    var feedViewLeft: CGPoint!
    var offset: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedViewLeft = feedView.center
        offset = 2 * (view.bounds.width/3)
        feedViewRight = CGPoint(x: feedView.center.x + offset ,y: feedView.center.y)
        
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        
        
        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast it as the custom view controller type you created in order to access it's properties and methods
        let feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedNavigationViewController") as! UINavigationController
        feedViewController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        feedViewController.navigationBar.tintColor = .white
        
        
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        displayContentController(containerView: feedView, content: feedViewController)
        
        displayContentController(containerView: menuView, content: menuViewController)
        
        
        //hideContentController(content: feedViewController)
        
        //hideContentController(content: menuViewController)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func displayContentController(containerView: UIView, content: UIViewController) {
        addChildViewController(content)
        containerView.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    
    
    
    func hideContentController(content: UIViewController) {
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
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
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {

        let translation = sender.translation(in: feedView)
        let velocity = sender.velocity(in: feedView)
        
        
        if sender.state == .began {
            feedViewInitialCenter = feedView.center
            
        } else if sender.state == .changed {
            if velocity.x > 0 {
                feedView.center = CGPoint(x: feedViewInitialCenter.x + translation.x, y: feedViewInitialCenter.y)
                print("moved right")
            }
                
            else if velocity.x < 0 {
                feedView.center = CGPoint(x: feedViewRight.x + translation.x, y: feedViewRight.y)
                print("moved left")
            }
            
        } else if sender.state == .ended {
            if velocity.x > 0 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.feedView.center = self.feedViewRight
                    }, completion: {(finished: Bool) -> Void in
                    
                })
            }
                
            else if velocity.x < 0 {
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.feedView.center = self.feedViewLeft
                }, completion: {(finished: Bool) -> Void in
                    
                })
            }
        }
    }
}
