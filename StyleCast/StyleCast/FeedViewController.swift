//
//  FeedViewController.swift
//  StyleCast
//
//  Created by Kim, YoungKyo (CONT) on 11/6/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

extension UIViewController {
    func styleNavigationBar() {
        view.layoutIfNeeded()
        
        if let image = UIImage(named: "logotype") {
            let imageRatio = image.size.height / image.size.width
            let newWidth = view.bounds.width / 3.0
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.bounds = CGRect(x: 0.0, y: 0.0, width: newWidth, height: newWidth * imageRatio)
            navigationItem.titleView = imageView
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
            
        }
    }
}

var navController: UINavigationController?

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var hamburgerButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        
        navController = self.navigationController
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt cellForRowAtindexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationViewCell") as! LocationViewCell
        return cell
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
