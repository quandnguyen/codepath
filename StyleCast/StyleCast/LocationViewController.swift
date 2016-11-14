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
    
    var contentViewOriginal: CGSize!
    var contentViewUp: CGSize!
    var contentViewDown: CGSize!
    
    var weatherIconViewOriginal: CGPoint!
    var weatherIconViewUp: CGPoint!
    var weatherIconViewDown: CGPoint!
    
    var weatherConditionViewOriginal: CGPoint!
    var weatherConditionViewUp: CGPoint!
    var weatherConditionViewDown: CGPoint!
    
    var tempViewOriginal: CGPoint!
    var tempViewUp: CGPoint!
    var tempViewDown: CGPoint!
    
    var locationViewOriginal: CGPoint!
    var locationViewUp: CGPoint!
    var locationViewDown: CGPoint!
    
    
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
        
        tempViewDown = tempView.center
        tempViewUp = CGPoint(x: view.frame.size.width - view.frame.size.width/4, y: view.frame.size.height/15)
        
        
        locationViewDown = locationView.center
        locationViewUp = CGPoint(x: view.frame.size.width - view.frame.size.width/4, y: tempViewUp.y + 30)

        weatherIconViewDown = weatherIconView.center
        weatherIconViewUp = CGPoint(x: view.frame.size.width/4, y: view.frame.size.height/15)
        
        weatherConditionViewDown = weatherConditionView.center
        weatherConditionViewUp = CGPoint(x:view.frame.size.width/4, y: weatherIconViewUp.y + 30)
 
        
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
            containerViewOriginal = containerView.frame.origin
            tempViewOriginal = tempView.frame.origin
            locationViewOriginal = locationView.frame.origin
            weatherIconViewOriginal = weatherIconView.frame.origin
            weatherConditionViewOriginal = weatherConditionView.frame.origin
            
            
        } else if sender.state == .changed {

            containerView.frame.origin = CGPoint(x: containerViewOriginal.x, y: containerViewOriginal.y + translation.y)
            
            tempView.frame.origin = CGPoint(x: tempViewOriginal.x, y: tempViewOriginal.y + translation.y)
            
            locationView.frame.origin = CGPoint(x: locationViewOriginal.x, y: locationViewOriginal.y + translation.y)
            
            weatherIconView.frame.origin = CGPoint(x: weatherIconViewOriginal.x, y: weatherIconViewOriginal.y + translation.y)
            
            weatherConditionView.frame.origin = CGPoint(x:weatherConditionViewOriginal.x, y: weatherConditionViewOriginal.y + translation.y)
            
            
            
            if tempView.frame.origin.y < 20 {tempView.frame.origin.y = 20}
            if tempView.frame.origin.y > tempViewOriginal.y {tempView.frame.origin.y = tempViewOriginal.y}
            
            if locationView.frame.origin.y < 100 {locationView.frame.origin.y = 100}
            if locationView.frame.origin.y > locationViewOriginal.y {locationView.frame.origin.y = locationViewOriginal.y}
            
            if weatherIconView.frame.origin.y < 20 {weatherIconView.frame.origin.y = 20}
            if weatherIconView.frame.origin.y > weatherIconViewOriginal.y {weatherIconView.frame.origin.y = weatherIconViewOriginal.y}
            
            if weatherConditionView.frame.origin.y < 100 {weatherConditionView.frame.origin.y = 100}
            if weatherConditionView.frame.origin.y > weatherConditionViewOriginal.y {weatherConditionView.frame.origin.y = locationViewOriginal.y}
            
            

            var velocity = sender.velocity(in: view)
            if velocity.y < 0 {
                self.contentView.frame.size = self.contentViewUp
                
            }
            
            print("Gesture is changing")
            
            
            
            
            
            
        } else if sender.state == .ended {
            var velocity = sender.velocity(in: view)
            
            if velocity.y < 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewUp
//                              self.contentView.frame.size = self.contentViewUp  << moved to sender.state == .changed to avoid flickering side effect with contentView is resizing
                                
                                self.tempView.center = self.tempViewUp
                                self.tempView.transform = CGAffineTransform(scaleX:0.5, y:0.5)
                                
                                self.locationView.center = self.locationViewUp
                                self.locationView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                
                                self.weatherIconView.center = self.weatherIconViewUp
                                self.weatherIconView.transform = CGAffineTransform(scaleX:0.5, y:0.5)
                                
                                self.weatherConditionView.center = self.weatherConditionViewUp
                                self.weatherConditionView.transform = CGAffineTransform(scaleX:0.8, y:0.8)
                                
                                print(self.contentView.frame.size.height)

                }, completion: nil)
                
                
                
            } else {

                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.3, options:[] ,
                               animations: { () -> Void in
                                self.containerView.frame.origin = self.containerViewDown
                                self.contentView.frame.size = self.contentViewDown
                                self.tempView.transform = CGAffineTransform(scaleX:1, y:1)
                                
                                self.tempView.center = self.tempViewDown
                                self.locationView.center = self.locationViewDown
                                self.locationView.transform = CGAffineTransform(scaleX:1, y:1)
                                
                                self.weatherIconView.center = self.weatherIconViewDown
                                self.weatherIconView.transform = CGAffineTransform(scaleX:1, y:1)
                                
                                self.weatherConditionView.center = self.weatherConditionViewDown
                                self.weatherConditionView.transform = CGAffineTransform(scaleX:1, y:1)

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
