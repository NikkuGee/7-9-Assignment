//
//  ViewController.swift
//  7 9 Assignment
//
//  Created by Consultant on 7/10/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var SendButton: UIButton!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var messageBox: UITextField!
    @IBOutlet weak var CountBox: UILabel!
    @IBOutlet weak var responseBox: UILabel!
    
    
    var countz: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SendButton.titleLabel?.textAlignment = NSTextAlignment.center
        SendButton.layer.cornerRadius = SendButton.layer.frame.size.height / 4
        FirstLabel.layer.cornerRadius = FirstLabel.layer.frame.size.height / 4
        
        NotificationCenter.default.addObserver(self, selector: #selector(Counted(sender:)), name: Notification.Name("Count"), object: nil)
    }


    @IBAction func SendButton(_ sender: Any) {
        let FourthVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        if let newText = messageBox.text {
            //sending information forward to a new VC
            FourthVC.message = newText

        }
        
        performSegue(withIdentifier: "FirstSeque", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let secondVC = segue.destination as! SecondViewController
        secondVC.worker = self
        print("worker is set")
        if let text = messageBox.text {
            secondVC.message = text
        }
    }
    
    @objc func Counted(sender: Notification){
        if CountBox.isHidden {
            CountBox.isHidden = false
        }
        countz = countz + 1
        CountBox.text = "Used count: \(countz)"
    }
}
extension FirstViewController: WorkInstructions {
    
    //6. implement the passed infomation from the function
    func passInformation(answer: String) {
        if responseBox.isHidden {
            responseBox.isHidden = false
        }
        if answer == "Yes" {
            responseBox.text = "Keep feeling awesome!"
        } else if answer == "No" {
            responseBox.text = "This too shall pass."
        }
    }
}

