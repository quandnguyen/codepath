//
//  ComposeViewController.swift
//  Week 4 - Tumblr
//
//  Created by Nguyen, Quan on 10/12/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    //make an array to hold the buttons
    var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //put the buttons in the defined array
        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        for i in buttons {
            i.center.y = view.frame.size.height
            i.alpha = 0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            self.textButton.center.y -= self.view.frame.size.height/1.6
            self.textButton.alpha = 1
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.photoButton.center.y -= self.view.frame.size.height/1.6
            self.photoButton.alpha = 1
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: [], animations: {
            self.quoteButton.center.y -= self.view.frame.size.height/1.6
            self.quoteButton.alpha = 1
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.linkButton.center.y -= self.view.frame.size.height/2.5
            self.linkButton.alpha = 1
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.6, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: [], animations: {
            self.chatButton.center.y -= self.view.frame.size.height/2.5
            self.chatButton.alpha = 1
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.8, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.videoButton.center.y -= self.view.frame.size.height/2.5
            self.videoButton.alpha = 1
            }, completion: nil)

        
    }
    
    
    @IBAction func didTapDismiss(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            self.textButton.center.y += self.view.frame.size.height
            self.textButton.alpha = 0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.photoButton.center.y += self.view.frame.size.height
            self.photoButton.alpha = 0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.15, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: [], animations: {
            self.quoteButton.center.y += self.view.frame.size.height
            self.quoteButton.alpha = 0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.linkButton.center.y += self.view.frame.size.height
            self.linkButton.alpha = 0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: [], animations: {
            self.chatButton.center.y += self.view.frame.size.height
            self.chatButton.alpha = 0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.videoButton.center.y += self.view.frame.size.height
            self.videoButton.alpha = 0
            }, completion: {finished in self.dismiss(animated: true, completion: nil)})
    }
    
    


}
