//
//  ViewController.swift
//  Calculator
//
//  Created by Chris on 2/6/17.
//  Copyright © 2017 Chris Messenger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var result: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func numericButtons(_ sender: UIButton) {
        result.text = (result.text ?? "") + (sender.titleLabel?.text ?? "")
    }

}
