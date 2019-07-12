//
//  ThirdViewController.swift
//  7 9 Assignment
//
//  Created by Consultant on 7/10/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    func passInformation(count: Int) {
        
    }
    

    @IBOutlet weak var WaitingMessage2: UILabel!
    
    var timer = Timer()
    var message: String = ""
    weak var worker: WorkInstructions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WaitingMessage2.layer.cornerRadius = WaitingMessage2.layer.frame.size.height / 4
        WaitingMessage2.text = "In the meantime, don't forget to improve your future-self"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(FirstTimerMessage), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    
    @objc func FirstTimerMessage() {
        WaitingMessage2.text = "Whether it's your physique"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(SecondTimerMessage), userInfo: nil, repeats: false)
    }
    
    @objc func SecondTimerMessage() {
        WaitingMessage2.text = "Or your mind"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ThirdTimerMessage), userInfo: nil, repeats: false)
    }
    
    @objc func ThirdTimerMessage() {
        WaitingMessage2.text = "Or your social life"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(FourthTimerMessage), userInfo: nil, repeats: false)
    }
    
    @objc func FourthTimerMessage() {
        let FourthVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        FourthVC.message = message
        FourthVC.worker = worker
        present(FourthVC, animated: true, completion: nil)

        
    }
}
