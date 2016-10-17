//
//  SearchViewController.swift
//  Week 4 - Tumblr
//
//  Created by Nguyen, Quan on 10/12/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchFeedView: UIImageView!
    @IBOutlet weak var loadingView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    //class for UIIMage array
    var images: [UIImage]!
    var animatedImage: UIImage!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Link the actual image files in your assets to your image variables
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        
        
        loadingView.image = animatedImage
        


        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        searchFeedView.alpha = 0
        loadingView.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            self.searchFeedView.alpha = 1
            self.loadingView.alpha = 0
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
