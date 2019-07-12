//
//  FourthViewController.swift
//  7 9 Assignment
//
//  Created by Consultant on 7/11/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

protocol WorkInstructions: class {
    
    func passInformation(answer: String)
    
}

class FourthViewController: UIViewController {
    @IBOutlet weak var Message1: UILabel!
    @IBOutlet weak var pastMessage: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var message: String!
    weak var worker: WorkInstructions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Message1.layer.cornerRadius = Message1.layer.frame.size.height / 4
        pastMessage.layer.cornerRadius = pastMessage.layer.frame.size.height / 4

        
        if let newText = message {
            pastMessage.text = newText
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesBack(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("Count"), object: nil)
        worker?.passInformation(answer: "Yes")
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func noBack(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("Count"), object: nil)
        worker?.passInformation(answer: "No")
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    

}
