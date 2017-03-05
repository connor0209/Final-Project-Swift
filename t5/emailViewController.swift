//
//  emailViewController.swift
//  t5
//
//  Created by Admin on 04/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import MessageUI
    
    class emailViewController: UIViewController, MFMailComposeViewControllerDelegate {
        let filename = "testfile"
        let strings = ["aadsad","basdasd","asdasdasdas"]
        
        @IBOutlet weak var emailButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
        }
        @IBAction func test(_ sender: Any) {
            sendEmail1()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func sendEmail(sender: UIButton) {
            sendEmail1()
        }
        func sendEmail1() {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["connor0209@gmail.com"])
                mail.setMessageBody("<b>You're generated groupings are as follows:</b>", isHTML: true)
                let joinedString = strings.joined(separator: "\n")
                print(joinedString)
                if let data = (joinedString as NSString).data(using: String.Encoding.utf8.rawValue){
                    //Attach File
                    mail.addAttachmentData(data, mimeType: "text/plain", fileName: "test")
                }
                present(mail, animated: true)
            } else {
                print("Device cannot send email")
        }
        }
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
}
