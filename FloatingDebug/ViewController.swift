//
//  ViewController.swift
//  FloatingDebug
//
//  Created by Dan Sinclair on 27/07/2016.
//  Copyright © 2016 Dan Sinclair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        (UIApplication.shared.delegate as! AppDelegate).fl.setImage(imageNamed: "relish_icon", andShow: true)
    }
    
}

