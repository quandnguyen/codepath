//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    

    var imageView: UIImageView!

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let toViewController = toViewController as! PhotoViewController
        
        feedViewController.selectedImageView.isHidden = true
        toViewController.imageView.isHidden = true
        
        imageView = UIImageView()
        imageView.image = feedViewController.selectedImageView.image
        let frame = containerView.convert(feedViewController.selectedImageView.frame, from: feedViewController.selectedImageView.superview)
        
        //let destinationFrame = containerView.convert(toViewController.imageView.frame, from: toViewController.imageView.superview)
        imageView.frame = frame
        

        imageView.contentMode = feedViewController.selectedImageView.contentMode
        imageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
        
        
        containerView.addSubview(imageView)
        


        
        toViewController.view.alpha = 0
        //var destinationImageFrame = toViewController.imageView.frame
        let destinationFrame = containerView.convert(toViewController.imageView.frame, from: toViewController.imageView.superview)
        
        //toViewController.imageView.frame = feedViewController.selectedImageView.frame
        
  
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            self.imageView.frame = destinationFrame
            
        }) { (finished: Bool) -> Void in
            
            feedViewController.selectedImageView.isHidden = false
            toViewController.imageView.isHidden = false
            self.imageView.removeFromSuperview()
            //toViewController.imageView.frame = destinationFrame
            self.finish()
        }
    }
    

    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let toViewController = navigationController.topViewController as! FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        toViewController.selectedImageView.isHidden = true
        photoViewController.imageView.isHidden = true
        
    
        
        imageView = UIImageView()
        imageView.image = photoViewController.imageView.image
        let frame = containerView.convert(photoViewController.imageView.frame, from: photoViewController.imageView.superview)
        
        imageView.frame = frame
        imageView.contentMode = photoViewController.imageView.contentMode

        imageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        
        containerView.addSubview(imageView)
        
        
        
        
        toViewController.view.alpha = 0
       var destinationFrame = containerView.convert(toViewController.selectedImageView.frame, from: toViewController.selectedImageView.superview)


        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            self.imageView.frame = destinationFrame
            
        }) { (finished: Bool) -> Void in
            photoViewController.imageView.isHidden = true
            toViewController.selectedImageView.isHidden = false
            self.imageView.removeFromSuperview()
            self.finish()
        }
    }
    
   
}
