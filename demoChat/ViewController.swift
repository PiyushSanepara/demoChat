//
//  ViewController.swift
//  demoChat
//
//  Created by piyushMac on 02/03/17.
//  Copyright © 2017 piyushMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    
    @IBOutlet var txtMessage: UITextView!
    @IBOutlet var btnSend: UIButton!
    
    let MessageArr = ["Hello!","Hi How r u!","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Hello!","Hi How r u!","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
    
//    let receiverMessageArr = ["Hello!","Hi How r u!","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtMessage.text = "Type a message here"
        txtMessage.textColor = UIColor.lightGray
        btnSend.isDisableConfig()
        
        txtMessage.becomeFirstResponder()
        txtMessage.selectedTextRange = txtMessage.textRange(from: txtMessage.beginningOfDocument, to: txtMessage.beginningOfDocument)
    }
    
//    MARK: For PlaceHolder, Send button Enable Disable
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentText = textView.text as NSString?
        let updatedText = currentText?.replacingCharacters(in: range, with: text)
        
        if (updatedText?.isEmpty)! {
            
            textView.text = "Type a message here"
            textView.textColor = UIColor.lightGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            
            btnSend.isDisableConfig()
            return false
        }
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.text = nil
            textView.textColor = UIColor.darkGray
            btnSend.isEnableConfig()
        }
        return true
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4 {// Change Condition with login id == sender id
            let cellSender = tableView.dequeueReusableCell(withIdentifier: "cellSender") as! cellSender
            
            cellSender.lblSenderMSG.text = MessageArr[indexPath.row]
            // Same as set sender name here
            
            return cellSender
        } else {
            let cellReceiver = tableView.dequeueReusableCell(withIdentifier: "cellReceiver") as! cellReceiver
            
            cellReceiver.lblReceiverMSG.text = MessageArr[indexPath.row]
            // Same as set receiver name here
            
            return cellReceiver
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

class cellSender: UITableViewCell {
    @IBOutlet var lblSenderName: UILabel!
    @IBOutlet var lblSenderMSG: UILabel!
}

class cellReceiver: UITableViewCell {
    @IBOutlet var lblReceiverName: UILabel!
    @IBOutlet var lblReceiverMSG: UILabel!
}

extension UIButton {
    func isEnableConfig() {
        self.alpha = 1.0
        self.isEnabled = true
    }
    func isDisableConfig() {
        self.alpha = 0.5
        self.isEnabled = false
    }
}
