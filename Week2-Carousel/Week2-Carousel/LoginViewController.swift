//
//  LoginViewController.swift
//  Week2-Carousel
//
//  Created by Nguyen, Quan on 9/30/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    // Outlets
    @IBOutlet weak var signinNavBarView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var fieldsParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!

    @IBOutlet weak var signinButton: UIButton!

    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        // Set the scroll view content size
        scrollView.contentSize = scrollView.frame.size
        // Set the content insets.
        scrollView.contentInset.bottom = 100
        
        self.buttonInitialY = self.buttonParentView.frame.origin.y
        self.buttonOffset = -40
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Move the button up above keyboard
            
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            // Scroll the scrollview up
            // Any code you put in here will be called when the keyboard is about to display
            }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY
            // Any code you put in here will be called when the keyboard is about to hide
            }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapSigninButton(_ sender: AnyObject) {
            if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty {
                let alertController = UIAlertController(title: "Email and Password Required", message: "Please enter your email and password", preferredStyle: .alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            } else {
                // Start animating the activity indicator
                signinIndicator.startAnimating()
                // Set the Button state to "Selected"
                // signinButton.isSelected = true
                if self.emailField.text == "justquan@gmail.com" && self.passwordField.text == "qn1234" {
                        // Delay for 2 second
                        delay(2, closure: { () -> () in
                            //stop animating the activity indicator.
                            self.signinIndicator.stopAnimating()
                            //Set the button state back to default, "Not Selected"
                            //self.signinButton.isSelected = false
                            //perform the Segue to the next screen.
                            self.performSegue(withIdentifier: "signinSegue", sender: nil)
                        })

                } else {
                        delay(2, closure: { () -> () in
                            let alertController = UIAlertController(title: "Invalid email or password", message: "Please enter a valid email and password", preferredStyle: .alert)
                        
                            // create an OK action
                            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                                self.signinIndicator.stopAnimating()
                                // handle response here.
                            }
                            // add the OK action to the alert controller
                            alertController.addAction(OKAction)
                        
                            self.present(alertController, animated: true) {
                            // optional code for what happens after the alert controller has finished presenting
                            }
                        })

                }

            }
    }

    @IBAction func backButton(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)

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
