//
//  SecondViewController.swift
//  7 9 Assignment
//
//  Created by Consultant on 7/10/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var WaitMessage: UILabel!
    
    var timer = Timer()
    var message: String = ""
    weak var worker: WorkInstructions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WaitMessage.layer.cornerRadius = WaitMessage.layer.frame.size.height / 4
        WaitMessage.text = "Hello!"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(FirstTimerMessage), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc func FirstTimerMessage() {
        WaitMessage.text = "Please wait for your future self to appear."
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(SecondTimerMessage), userInfo: nil, repeats: false)
        
    }
    
    @objc func SecondTimerMessage(){
        WaitMessage.text = "This will take a little while."
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ThirdTimerMessage), userInfo: nil, repeats: false)
    }
    
    @objc func ThirdTimerMessage() {
        let ThirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        ThirdVC.message = message
        ThirdVC.worker = worker
        present(ThirdVC, animated: true, completion: nil)
        
    }

}
