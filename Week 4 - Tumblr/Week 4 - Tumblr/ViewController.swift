//
//  ViewController.swift
//  Week 4 - Tumblr
//
//  Created by Nguyen, Quan on 10/12/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //1: create content view outlet
    @IBOutlet weak var contentView: UIView!
    
    //2: create IBOutlet array named buttons to hold your tab bar buttons. drag all the buttons to the array
    @IBOutlet var buttons: [UIButton]!
    
    //3a: create variables to hold each ViewController associated with a tab
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    //3b: An array to hold all our ViewController
    var viewControllers: [UIViewController]!
    
    
    //3c: Define a variable to keep track of the tab button that is selected
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //4a: Link ViewController Vars to the ViewControllers in the Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //4b: Instantiate each ViewController by referencing storyboard and the particular ViewController's Storyboard ID
        homeViewController = storyboard.instantiateViewController(withIdentifier: "homeViewID")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "searchViewID")
        composeViewController = storyboard.instantiateViewController(withIdentifier: "composeViewID")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "accountViewID")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "trendingViewID")
        
        print ("all views created")
        
        //5: add each ViewController to your viewControllers array
        viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]
        
        //10: set the initial tab when the app starts
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }

    //6: drag the first button in the tab bar to create an action then drag the rest of the buttons to the same action

    @IBAction func didPressTab(_ sender: UIButton) {
        //7a: keep track of the previous button that was pressed
        let previousIndex = selectedIndex
        
        //7b: set seletedIndex to the tag value of whichever button was tapped
        selectedIndex = sender.tag
        
        //8a: access your previous button and set it to the non-selected state
        buttons[previousIndex].isSelected = false
        
        //8b: use the previousIndex to access the previous ViewController from the viewControllers array
        let previousVC = viewControllers[previousIndex]
        
        //8c: remove the previous ViewController
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //9a: access your current selected button and set it to the selected state
        sender.isSelected = true
        
        //9b: use selectedIndex to access the current ViewController from the viewControllers array
        let vc = viewControllers[selectedIndex]
        
        //9c: add the new viewcontroller
        addChildViewController(vc)
        
        //9d: adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        //9e: call the viewDidAppear method of the ViewController you are adding using didMove(toParentViewController: self)
        vc.didMove(toParentViewController: self)
        
    }
    
    


}

