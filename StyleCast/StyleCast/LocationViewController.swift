//
//  LocationViewController.swift
//  StyleCast
//
//  Created by Nguyen, Quan on 11/4/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var blueSkyView: UIView!
    @IBOutlet weak var tabBarContainerView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var weatherButton: UIButton!
    @IBOutlet weak var stylesButton: UIButton!
    @IBOutlet weak var tipsButton: UIButton!
    
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
        //link ViewController Vars to the ViewControllers in the Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //instantiate each ViewController by referencing storyboard and the particular ViewController's Storyboard ID
        weatherViewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewID")
        stylesViewController = storyboard.instantiateViewController(withIdentifier: "StylesViewID")
        tipsViewController = storyboard.instantiateViewController(withIdentifier: "TipsViewID")
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
