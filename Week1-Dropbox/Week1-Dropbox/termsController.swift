//
//  termsController.swift
//  Week1-Dropbox
//
//  Created by Nguyen, Quan on 9/25/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class termsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)


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
