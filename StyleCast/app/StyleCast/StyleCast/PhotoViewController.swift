//
//  PhotoDetailViewController.swift
//  StyleCast
//
//  Created by Nguyen, Quan on 11/6/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var closeButtonView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    
    @IBOutlet weak var locationView: UILabel!
    @IBOutlet weak var tempView: UILabel!
    @IBOutlet weak var weatherIconView: UIImageView!
    
    @IBOutlet weak var likesView: UILabel!
    @IBOutlet weak var timeStampView: UILabel!
    @IBOutlet weak var heartButtonView: UIButton!
    
    var image: UIImage!
    var attributes: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attributes = [locationView, tempView, timeStampView, likesView, weatherIconView, heartButtonView, closeButtonView]
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.85)
        
        imageView.image = image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapClose(_ sender: UIButton) {
        for eachView in attributes {
            eachView.isHidden = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(white:0, alpha: 0.5)
        }
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            for eachView in self.attributes {
                eachView.isHidden = true
            }
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
                for eachView in self.attributes {
                    eachView.isHidden = false
                }
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
