//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    var tempImageView: UIImageView!
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let fromViewController = fromViewController as! scanViewController
        let toViewController = toViewController as! photoViewController
        
        fromViewController.selectedImageView.isHidden = true
        toViewController.imageView.isHidden = true
        toViewController.heartView.isHidden = true
        toViewController.likeView.isHidden = true
        toViewController.locationView.isHidden = true
        toViewController.timeView.isHidden = true
        
        tempImageView = UIImageView()
        tempImageView.image = fromViewController.selectedImageView.image
        let frame = containerView.convert(fromViewController.selectedImageView.frame, from: fromViewController.selectedImageView.superview)
        
        tempImageView.frame = frame
        
        tempImageView.contentMode = fromViewController.selectedImageView.contentMode
        tempImageView.clipsToBounds = fromViewController.selectedImageView.clipsToBounds
        
        containerView.addSubview(tempImageView)
        
        toViewController.view.alpha = 0
        let destinationFrame = containerView.convert(toViewController.imageView.frame, from: toViewController.imageView.superview)
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            self.tempImageView.frame = destinationFrame
            
        }) { (finished: Bool) -> Void in
            fromViewController.selectedImageView.isHidden = false
            toViewController.imageView.isHidden = false
            toViewController.heartView.isHidden = false
            toViewController.likeView.isHidden = false
            toViewController.locationView.isHidden = false
            toViewController.timeView.isHidden = false
            self.tempImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    
    
    
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let fromViewController = fromViewController as! photoViewController
        let toViewController = toViewController as! scanViewController
        
        
        
        fromViewController.imageView.isHidden = true
        fromViewController.heartView.isHidden = true
        fromViewController.likeView.isHidden = true
        fromViewController.locationView.isHidden = true
        fromViewController.timeView.isHidden = true
        toViewController.selectedImageView.isHidden = true
        
        tempImageView = UIImageView()
        tempImageView.image = fromViewController.imageView.image
        let frame = containerView.convert(fromViewController.imageView.frame, from: fromViewController.imageView.superview)
        
        tempImageView.frame = frame
        
        tempImageView.contentMode = fromViewController.imageView.contentMode
        tempImageView.clipsToBounds = fromViewController.imageView.clipsToBounds
        
        containerView.addSubview(tempImageView)
        
        fromViewController.view.alpha = 1
        let destinationFrame = containerView.convert(toViewController.selectedImageView.frame, to: toViewController.selectedImageView.superview)
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            self.tempImageView.frame = destinationFrame
        }) { (finished: Bool) -> Void in
            fromViewController.imageView.isHidden = true
            fromViewController.heartView.isHidden = true
            fromViewController.likeView.isHidden = true
            fromViewController.locationView.isHidden = true
            fromViewController.timeView.isHidden = true
            toViewController.selectedImageView.isHidden = false
            self.tempImageView.removeFromSuperview()
            self.finish()
        }
    }
}
