//
//  FeedViewController.swift
//  week 5 - facebook
//
//  Created by Nguyen, Quan on 10/22/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var wedding1View: UIImageView!
    @IBOutlet weak var wedding2View: UIImageView!
    @IBOutlet weak var wedding3View: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var fadeTransition: FadeTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        
        
        // Do any additional setup after loading the view.
    }
    


    
    
    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as!UIImageView
        
        performSegue(withIdentifier: "feedToPhoto", sender: nil)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination as! PhotoViewController
        
        destinationViewController.image = self.selectedImageView.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        fadeTransition = FadeTransition()
        
        destinationViewController.transitioningDelegate = fadeTransition
        
        fadeTransition.duration = 1.0
        
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
