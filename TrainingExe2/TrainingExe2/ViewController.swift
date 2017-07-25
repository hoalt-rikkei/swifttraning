//
//  ViewController.swift
//  TrainingExe2
//
//  Created by ios developer on 7/21/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstnameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var fistnameJpInPut: UITextField!
    @IBOutlet weak var lastnameJpInput: UITextField!
    @IBOutlet weak var emailTextInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var maleRadio: UIButton!
    @IBOutlet weak var femaleRadio: UIButton!
    @IBOutlet weak var phoneNum1: UITextField!
    @IBOutlet weak var phoneNum2: UITextField!
    @IBOutlet weak var phoneNum3: UITextField!
    
    var checkBox = UIImage(named: "ic-checked")
    var uncheckBox = UIImage(named: "ic-unchecked")
    
    var isMale:Bool!
    
    
    @IBAction func maleCheck(_ sender: Any) {
        isMale = true
        maleRadio.setImage(checkBox, for: UIControlState.normal)
        femaleRadio.setImage(uncheckBox, for: UIControlState.normal)
    }
    
    @IBAction func femaleCheck(_ sender: Any) {
        isMale = false
        maleRadio.setImage(uncheckBox, for: UIControlState.normal)
        femaleRadio.setImage(checkBox, for: UIControlState.normal)
    }
    
    @IBAction func submitClick(_ sender: Any) {
        self.validateTextInput()
    }
    
    let Feilds = ["Email"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameInput.delegate = self
        lastnameInput.delegate = self
        fistnameJpInPut.delegate = self
        lastnameJpInput.delegate = self
        emailTextInput.delegate = self
        birthdayInput.delegate = self
        phoneNum1.delegate = self
        phoneNum2.delegate = self
        phoneNum3.delegate = self
        firstnameInput.returnKeyType = UIReturnKeyType.next
        lastnameInput.returnKeyType = UIReturnKeyType.next
        fistnameJpInPut.returnKeyType = UIReturnKeyType.next
        lastnameJpInput.returnKeyType = UIReturnKeyType.next
        emailTextInput.returnKeyType = UIReturnKeyType.next
        birthdayInput.returnKeyType = UIReturnKeyType.next
        phoneNum1.returnKeyType = UIReturnKeyType.next
        phoneNum2.returnKeyType = UIReturnKeyType.next
        phoneNum3.returnKeyType = UIReturnKeyType.done
        phoneNum1.keyboardType = UIKeyboardType.numberPad
        phoneNum2.keyboardType = UIKeyboardType.numberPad
        phoneNum3.keyboardType = UIKeyboardType.numberPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.phoneNum1.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    // MARK: -
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstnameInput:
            textField.resignFirstResponder()
            lastnameInput.becomeFirstResponder()
            break
        case lastnameInput:
            textField.resignFirstResponder()
            fistnameJpInPut.becomeFirstResponder()
            break
        case fistnameJpInPut:
            textField.resignFirstResponder()
            lastnameJpInput.becomeFirstResponder()
            break
        case lastnameJpInput:
            textField.resignFirstResponder()
            emailTextInput.becomeFirstResponder()
            break
        case emailTextInput:
            textField.resignFirstResponder()
            birthdayInput.becomeFirstResponder()
            break
        case birthdayInput:
            textField.resignFirstResponder()
            phoneNum1.becomeFirstResponder()
            break
        case phoneNum1:
            textField.resignFirstResponder()
            phoneNum2.becomeFirstResponder()
            break
        case phoneNum2:
            textField.resignFirstResponder()
            phoneNum3.becomeFirstResponder()
            break
        case phoneNum3:
            textField.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
    
    func showAlert(title: String, message: String) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    func isValidEmail(emailInput: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emailInput)
        return result
    }
    
    func validateTextInput() {
        
        if (firstnameInput.text?.isEmpty)!
            || (lastnameInput.text?.isEmpty)!
            || (fistnameJpInPut.text?.isEmpty)!
            || (lastnameJpInput.text?.isEmpty)!
            || (emailTextInput.text?.isEmpty)!
            || (birthdayInput.text?.isEmpty)!
            || (phoneNum1.text?.isEmpty)!
            || (phoneNum2.text?.isEmpty)!
            || (phoneNum3.text?.isEmpty)! {
            self.showAlert(title: "", message: "Chưa nhập đủ đầu vào")
        } else if (!self.isValidEmail(emailInput: emailTextInput.text!)){
            self.showAlert(title: "", message: "Email sai định dạng")
        } else {
            self.showAlert(title: "", message: "Đăng ký thành công")
        }
    }

}

