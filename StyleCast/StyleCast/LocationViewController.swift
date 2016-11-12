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
    
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var weatherConditionView: UILabel!
    @IBOutlet weak var tempView: UILabel!
    @IBOutlet weak var locationView: UILabel!
    
    var containerViewOriginal: CGPoint!
    var containerViewUp: CGPoint!
    var containerViewDown: CGPoint!
    
    var contentViewUp: CGSize!
    var contentViewDown: CGSize!
    
//    var tempViewOriginal: CGRect!
//    var tempViewUp: CGRect!
//    var tempViewDown: CGRect!
//    
//    var locationViewOriginal: CGRect!
//    var locationViewUp: CGRect!
//    var locationViewDown: CGRect!
//    
//    var weatherIconViewOriginal: CGRect!
//    var weatherIconViewUp: CGRect!
//    var weatherIconViewDown: CGRect!
//    
//    var weatherConditionOriginal: CGRect!
//    var weatherConditionUp: CGRect!
//    var weatherConditionDown: CGRect!
    
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
        

        
        tempStartingYValue = tempView.frame.origin.y
        tempStartingXValue = tempView.frame.origin.x
        tempStartingSize = tempView.frame.size.width
        
        iconStartingYValue = weatherIconView.frame.origin.y
        iconStartingXValue = weatherIconView.frame.origin.x
        iconStartingSize = weatherIconView.frame.size.width

        locationStartingYValue = locationView.frame.origin.y
        locationStartingXValue = locationView.frame.origin.x
        locationStartingSize = locationView.frame.size.width
        
        conditionStartingYValue = weatherConditionView.frame.origin.y
        conditionStartingXValue = weatherConditionView.frame.origin.x
        conditionStartingSize = weatherConditionView.frame.size.width
        
        
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
    
    
   
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            //print("Gesture began")
           containerViewOriginal = containerView.frame.origin
           self.contentView.frame.size = self.contentViewDown
            //self.tempView.frame = self.tempViewDown
        } else if sender.state == .changed {
            containerView.frame.origin = CGPoint(x: containerViewOriginal.x, y: containerViewOriginal.y + translation.y)
            
            let offset = translation.y
            
            
            //when I scroll the list, degree image view changes the x position
            //        degreeStaringXValue = original - offset
            
            
            var nextXPosition = tempStartingXValue + offset
            if nextXPosition > 280 { nextXPosition = 280 }
            tempView.frame.origin = CGPoint(x: nextXPosition, y: tempView.frame.origin.y)
            
            
            
            
            // This method is called as the user scrolls
            
            var nextYPosition = tempStartingYValue - offset
            if nextYPosition < 30 { nextYPosition = 30 }
            tempView.frame.origin = CGPoint(x: tempView.frame.origin.x, y: nextYPosition)
            
            
            // This method is called as the user scrolls + size
            
            let change = 230 - offset
            let total: CGFloat = 230
            var percentOfTotal = change / total
            if percentOfTotal < 0.40 { percentOfTotal = 0.40 }
            //       if nextXPosition > 250 { nextScale = 1 }
            
            tempView.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
            
            //////-------------------------
            
            var iconnextYPosition = iconStartingYValue - offset
            if iconnextYPosition < 40 { iconnextYPosition = 40 }
            
            weatherIconView.frame.origin = CGPoint(x: weatherIconView.frame.origin.x, y: iconnextYPosition)
            
            
            
            var iconnextXPosition = iconStartingXValue - offset
            if iconnextXPosition < 30 { iconnextXPosition = 30 }
            weatherIconView.frame.origin = CGPoint(x: iconnextXPosition, y: weatherIconView.frame.origin.y)
            
            
            // This method is called as the user scrolls + size
            
            
            if percentOfTotal < 0.50 { percentOfTotal = 0.50 }
            //       if nextXPosition > 250 { nextScale = 1 }
            
            weatherIconView.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
            
            
            //////-------------------------
            
            
            var lonextYPosition = locationStartingYValue - offset
            if lonextYPosition < 65 { lonextYPosition = 65 }
            locationView.frame.origin = CGPoint(x: locationView.frame.origin.x, y: lonextYPosition)
            
            // This method is called as the user scrolls
            
            
            var lonextXPosition = locationStartingXValue + offset
            if lonextXPosition > 230 { lonextXPosition = 230 }
            locationView.frame.origin = CGPoint(x: lonextXPosition, y: locationView.frame.origin.y)
            
            if percentOfTotal < 0.80 { percentOfTotal = 0.80 }
            //       if nextXPosition > 250 { nextScale = 1 }
            
            locationView.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
            
            //////-------------------------
            
            var conditionnextYPosition = conditionStartingYValue - offset
            if conditionnextYPosition < 65 { conditionnextYPosition = 65 }
            
            weatherConditionView.frame.origin = CGPoint(x: weatherConditionView.frame.origin.x, y: conditionnextYPosition)
            
            
            
            var conditionnextXPosition = conditionStartingXValue - offset
            if conditionnextXPosition < 30 { conditionnextXPosition = 30 }
            weatherConditionView.frame.origin = CGPoint(x: conditionnextXPosition, y: weatherConditionView.frame.origin.y)
            
            
            // This method is called as the user scrolls + size
            
            
            if percentOfTotal < 0.80 { percentOfTotal = 0.80 }
            //       if nextXPosition > 250 { nextScale = 1 }
            
            weatherConditionView.transform = CGAffineTransform(scaleX: percentOfTotal, y: percentOfTotal)
            
            
            
            
            
            
            
            
            print("Gesture is changing")
        } else if sender.state == .ended {
            var velocity = sender.velocity(in: view)
            
            if velocity.y < -10 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewUp
                                self.contentView.frame.size = self.contentViewUp
                                //self.tempView.frame = self.tempViewUp
                                
                                print(self.contentView.frame.size.height)

                }, completion: nil)
                
                
                
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewDown
                                self.contentView.frame.size = self.contentViewDown
                                //self.tempView.frame = self.tempViewDown
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
