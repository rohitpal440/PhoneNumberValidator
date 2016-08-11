//
//  ViewController.swift
//  Phone Number Validator
//
//  Created by Rohit Pal on 11/08/16.
//  Copyright © 2016 Rohit Pal. All rights reserved.
//

import UIKit
import PhoneNumberKit
class ValidatorViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: PhoneNumberTextField!
    
    @IBOutlet weak var validateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.defaultRegion = "IN"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func validatePhoneNumber(sender: AnyObject) {
        if phoneNumberTextField.isValidNumber {
            let phoneNumber:String = phoneNumberTextField.text!
            let dialerURL:String = "tel://" + phoneNumber.stringByReplacingOccurrencesOfString(" ", withString: "")
            print(dialerURL)
            let url:NSURL = NSURL(string: dialerURL)!
            print(url)
            if (UIApplication.sharedApplication().canOpenURL(url))
            {
                UIApplication.sharedApplication().openURL(url)
            } else{
                let alert = UIAlertView()
                alert.title = "OOPs"
                alert.message = "Unable to launch dialer. Please check if Dialer is installed!"
                alert.addButtonWithTitle("OK")
                alert.show()

            }
        } else {
            let alert = UIAlertView()
            alert.title = "OOPs"
            alert.message = "Number You've Entered is Invalid. Please check the number"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
