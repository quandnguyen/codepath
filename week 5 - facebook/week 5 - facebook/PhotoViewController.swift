//
//  PhotoViewController.swift
//  week 5 - facebook
//
//  Created by Nguyen, Quan on 10/22/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var photoActions: UIImageView!


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        
        imageView.image = image

    }
    
    

    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        UIView.animate(withDuration: 0.5) {
            self.doneButton.isHidden = true
            self.photoActions.isHidden = true
        }

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(white:0, alpha: 0)
            self.doneButton.alpha = 0
            self.photoActions.alpha = 0
        }

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let scrollY = scrollView.contentOffset.y
        
        if scrollY < -50 {
            dismiss(animated: true, completion: nil)
            self.view.backgroundColor = UIColor(white:0, alpha: 0)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor = UIColor(white:0, alpha: 1)
                self.doneButton.alpha = 1
                self.photoActions.alpha = 1
                
            }
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(white:0, alpha: 1)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
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
