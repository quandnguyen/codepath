//
//  LocationViewController.swift
//  StyleCast
//
//  Created by Nguyen, Quan on 11/4/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var tabBarContainerView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var weatherButton: UIButton!
    @IBOutlet weak var stylesButton: UIButton!
    @IBOutlet weak var tipsButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tempText: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var conditionText: UITextField!
    
    
    var containerViewOriginal: CGPoint!
    var containerViewUp: CGPoint!
    var containerViewDown: CGPoint!
    
    var contentViewUp: CGSize!
    var contentViewDown: CGSize!
    
    var tempStartingYValue: CGFloat = 0
    var tempStartingXValue: CGFloat = 0
    var tempStartingSize: CGFloat = 0
    
    var iconStartingYValue: CGFloat = 0
    var iconStartingXValue: CGFloat = 0
    var iconStartingSize: CGFloat = 0
    
    var locationStartingYValue: CGFloat = 0
    var locationStartingXValue: CGFloat = 0
    var locationStartingSize: CGFloat = 0
    
    var conditionStartingYValue: CGFloat = 0
    var conditionStartingXValue: CGFloat = 0
    var conditionStartingSize: CGFloat = 0
    
    //make an array to hold tab bar buttons
    var buttons: [UIButton]!
    
    //vars to hold views associated with tabs
    var weatherViewController: UIViewController!
    var stylesViewController: UIViewController!
    var tipsViewController: UIViewController!
    
    //an array to hold all our view controllers
    var viewControllers: [UIViewController]!
    
    //define a variable to keep track of the tab button that is selected
    var selectedIndex: Int = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()


        containerView.frame.size.height = (view.frame.size.height) - (view.frame.size.height/6)
        containerView.frame.origin.y = view.frame.size.height/2
        
        containerViewUp = CGPoint(x: containerView.frame.origin.x, y: view.frame.size.height/6)
        containerViewDown = CGPoint(x:containerView.frame.origin.x, y: view.frame.size.height/2)
        
        contentView.frame.size.height = view.frame.size.height/2 - tabBarContainerView.frame.size.height
        contentViewDown = CGSize(width: view.frame.size.width, height: view.frame.size.height/2 - tabBarContainerView.frame.size.height)
        contentViewUp = CGSize(width: view.frame.size.width, height: containerView.frame.size.height - tabBarContainerView.frame.size.height)
        
        
        tempStartingYValue = tempText.frame.origin.y
        tempStartingXValue = tempText.frame.origin.x
        tempStartingSize = tempText.frame.size.width

        
        iconStartingYValue = iconImageView.frame.origin.y
        iconStartingXValue = iconImageView.frame.origin.x
        iconStartingSize = iconImageView.frame.size.width

        locationStartingYValue = locationText.frame.origin.y
        locationStartingXValue = locationText.frame.origin.x
        locationStartingSize = locationText.frame.size.width
        
        conditionStartingYValue = conditionText.frame.origin.y
        conditionStartingXValue = conditionText.frame.origin.x
        conditionStartingSize = conditionText.frame.size.width
        
        
        //link ViewController Vars to the ViewControllers in the Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //instantiate each ViewController by referencing storyboard and the particular ViewController's Storyboard ID
        weatherViewController = storyboard.instantiateViewController(withIdentifier: "WeatherControllerID")
        stylesViewController = storyboard.instantiateViewController(withIdentifier: "StylesControllerID")
        tipsViewController = storyboard.instantiateViewController(withIdentifier: "TipsControllerID")
        
        //add each ViewController to your viewControllers array
        viewControllers = [weatherViewController, stylesViewController, tipsViewController]
        
        //put the buttons in the defined array
        buttons = [weatherButton, stylesButton, tipsButton]
        
        //set default in content view
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        
        
        let offset = scrollView.contentOffset.y
        
        
        //when I scroll the list, degree image view changes the x position
        //        degreeStaringXValue = original - offset
        
        
        var nextXPosition = tempStartingXValue + offset
        if nextXPosition > 280 { nextXPosition = 280 }
        tempText.frame.origin = CGPoint(x: nextXPosition, y: tempText.frame.origin.y)
        
        
        
        
        // This method is called as the user scrolls
        
        var nextYPosition = tempStartingYValue - offset
        if nextYPosition < 30 { nextYPosition = 30 }
        tempText.frame.origin = CGPoint(x: tempText.frame.origin.x, y: nextYPosition)
        
        
        // This method is called as the user scrolls + size
        
        let change = 230 - offset
        let total: CGFloat = 230
        var percentOfTotal = change / total
        if percentOfTotal < 0.40 { percentOfTotal = 0.40 }
        //       if nextXPosition > 250 { nextScale = 1 }
        
        tempText.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
        
        //////-------------------------
        
        var iconnextYPosition = iconStartingYValue - offset
        if iconnextYPosition < 40 { iconnextYPosition = 40 }
        
        iconImageView.frame.origin = CGPoint(x: iconImageView.frame.origin.x, y: iconnextYPosition)
        
        
        
        var iconnextXPosition = iconStartingXValue - offset
        if iconnextXPosition < 30 { iconnextXPosition = 30 }
        iconImageView.frame.origin = CGPoint(x: iconnextXPosition, y: iconImageView.frame.origin.y)
        
        
        // This method is called as the user scrolls + size
        
        
        if percentOfTotal < 0.50 { percentOfTotal = 0.50 }
        //       if nextXPosition > 250 { nextScale = 1 }
        
        iconImageView.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
        
        
        //////-------------------------
       
        
        var lonextYPosition = locationStartingYValue - offset
        if lonextYPosition < 65 { lonextYPosition = 65 }
        locationText.frame.origin = CGPoint(x: locationText.frame.origin.x, y: lonextYPosition)
        
        // This method is called as the user scrolls
        
     
        var lonextXPosition = locationStartingXValue + offset
        if lonextXPosition > 230 { lonextXPosition = 230 }
        locationText.frame.origin = CGPoint(x: lonextXPosition, y: locationText.frame.origin.y)

        if percentOfTotal < 0.80 { percentOfTotal = 0.80 }
        //       if nextXPosition > 250 { nextScale = 1 }
        
        locationText.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
        
        //////-------------------------
        
        var conditionnextYPosition = conditionStartingYValue - offset
        if conditionnextYPosition < 65 { conditionnextYPosition = 65 }
        
        conditionText.frame.origin = CGPoint(x: conditionText.frame.origin.x, y: conditionnextYPosition)
        
        
        
        var conditionnextXPosition = conditionStartingXValue - offset
        if conditionnextXPosition < 30 { conditionnextXPosition = 30 }
        conditionText.frame.origin = CGPoint(x: conditionnextXPosition, y: conditionText.frame.origin.y)
        
        
        // This method is called as the user scrolls + size
        
        
        if percentOfTotal < 0.80 { percentOfTotal = 0.80 }
        //       if nextXPosition > 250 { nextScale = 1 }
        
        conditionText.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
        
        
  
    }

    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            //print("Gesture began")
           containerViewOriginal = containerView.frame.origin
           self.contentView.frame.size = self.contentViewDown
        } else if sender.state == .changed {
            containerView.frame.origin = CGPoint(x: containerViewOriginal.x, y: containerViewOriginal.y + translation.y)
            print("Gesture is changing")
        } else if sender.state == .ended {
            var velocity = sender.velocity(in: view)
            
            if velocity.y < -10 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewUp
                                self.contentView.frame.size = self.contentViewUp
                                
                                print(self.contentView.frame.size.height)

                }, completion: nil)
                
                
                
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewDown
                                self.contentView.frame.size = self.contentViewDown
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
