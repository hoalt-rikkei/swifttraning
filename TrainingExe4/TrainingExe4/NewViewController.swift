//
//  NewViewController.swift
//  TrainingExe4
//
//  Created by ios developer on 8/1/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBAction func backClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Controller"
    }

}
