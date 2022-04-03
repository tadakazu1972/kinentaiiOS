//
//  MailViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/29.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import Foundation
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var mAddressArray: [String] = []
    
    init(addressArray: [String]) {
        super.init(nibName: nil, bundle: nil)
        mAddressArray = addressArray
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func sendMail(){
        if MFMailComposeViewController.canSendMail()==false {
            print("Email Send Failed")
            return
        }
        
        let mailViewController = MFMailComposeViewController()
        //let recipients = ["tadakazu1972@gmail.com"]
        let recipients = mAddressArray
        
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("緊急連絡")
        mailViewController.setToRecipients(recipients)
        mailViewController.setMessageBody("メール本文", isHTML: false)
        
        self.present(mailViewController, animated:true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result  {
        case .cancelled:
            //自らを削除
            self.dismiss(animated: true, completion: nil)
            break
        case .saved:
            //自らを削除
            self.dismiss(animated: true, completion: nil)
            break
        case .sent:
            //自らを削除
            self.dismiss(animated: true, completion: nil)
            break
        case .failed:
            //自らを削除
            self.dismiss(animated: true, completion: nil)
            break
        default:
            break
        }
        //自らを削除
        self.dismiss(animated: true, completion: nil)
    }
}
