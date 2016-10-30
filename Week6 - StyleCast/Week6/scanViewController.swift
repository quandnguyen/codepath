//
//  scanViewController.swift
//  Week6
//
//  Created by Nguyen, Quan on 10/29/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class scanViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var photo1: UIImageView!
    
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = bgImageView.frame.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "photoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! photoViewController
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
