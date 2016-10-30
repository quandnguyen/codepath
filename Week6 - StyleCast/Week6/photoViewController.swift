//
//  photoViewController.swift
//  Week6
//
//  Created by Nguyen, Quan on 10/29/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class photoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var closeButtonView: UIButton!
    @IBOutlet weak var timeView: UITextView!
    @IBOutlet weak var likeView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationView: UIImageView!
    @IBOutlet weak var heartView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.85)
        
        imageView.image = image
    }

    
    @IBAction func didTapClose(_ sender: UIButton) {
        self.closeButtonView.isHidden = true
        self.timeView.isHidden = true
        self.likeView.isHidden = true
        self.locationView.isHidden = true
        self.heartView.isHidden = true
        dismiss(animated: true, completion: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(white:0, alpha: 0.5)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.closeButtonView.isHidden = true
            self.timeView.isHidden = true
            self.likeView.isHidden = true
            self.heartView.isHidden = true
            self.locationView.isHidden = true
        }
    }

    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        let yScroll = scrollView.contentOffset.y
        
        print("\(yScroll)")
        
        if yScroll < -35 {
            dismiss(animated: true, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 0.5) {
                self.closeButtonView.isHidden = false
                self.timeView.isHidden = false
                self.likeView.isHidden = false
                self.heartView.isHidden = false
                self.locationView.isHidden = false
            }
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(white:0, alpha: 0.85)
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.view.backgroundColor = UIColor(white:0, alpha: 0.85)
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
