//
//  introViewController.swift
//  Week2-Carousel
//
//  Created by Nguyen, Quan on 9/29/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class introViewController: UIViewController, UIScrollViewDelegate {
        // Outlets & actions //
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateTile(tileView: tile1View, yOffset: -500, xOffset: 30, scaleRatio: 1.0, rotationOffset: -10)
        animateTile(tileView: tile2View, yOffset: -445, xOffset: -80, scaleRatio: 2.0, rotationOffset: 30)
        animateTile(tileView: tile3View, yOffset: -350, xOffset: -40, scaleRatio: 1.50, rotationOffset: 20)
        animateTile(tileView: tile4View, yOffset: -550, xOffset: 20, scaleRatio: 1.50, rotationOffset: -10)
        animateTile(tileView: tile5View, yOffset: -465, xOffset: -10, scaleRatio: 1.25, rotationOffset: 10)
        animateTile(tileView: tile6View, yOffset: -600, xOffset: 55, scaleRatio: 1.25, rotationOffset: -10)
        
        //content offset: 0 -> 668
        //x offset: -30 -> 0
        //y offset: -285 -> 0
    }

    
    func animateTile (tileView: UIImageView, yOffset: CGFloat, xOffset: CGFloat, scaleRatio: CGFloat, rotationOffset: CGFloat) {
        
        let offset = CGFloat(scrollView.contentOffset.y)
        
        //content offset: 0 -> 668
        //x offset: -30 -> 0
        //y offset: -285 -> 0
        
        let tx = convertValue(inputValue: offset, r1Min: 0, r1Max: 668, r2Min: xOffset, r2Max: 0)
        let ty = convertValue(inputValue: offset, r1Min: 0, r1Max: 668, r2Min: yOffset, r2Max: 0)
        let scale = convertValue(inputValue: offset, r1Min: 0, r1Max: 668, r2Min: scaleRatio, r2Max: 1)
        let rotation = convertValue(inputValue: offset, r1Min: 0, r1Max: 668, r2Min: rotationOffset, r2Max: 0)
        
        let tileScale = CGAffineTransform(scaleX: scale, y: scale)
        let tileTranslate = CGAffineTransform(translationX: tx,y: ty)
        let tileRotate = CGAffineTransform(rotationAngle: CGFloat(Double(rotation) * M_PI / 180))
        
        tileView.transform = tileScale.concatenating(tileTranslate).concatenating(tileRotate)
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
