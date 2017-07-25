//
//  ViewController.swift
//  TrainingExe2
//
//  Created by ios developer on 7/21/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstnameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var firstnameJpInput: UITextField!
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
    var isMale = true
    
    // MARK: - Setup view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameInput.delegate = self
        lastnameInput.delegate = self
        firstnameJpInput.delegate = self
        lastnameJpInput.delegate = self
        emailTextInput.delegate = self
        birthdayInput.delegate = self
        phoneNum1.delegate = self
        phoneNum2.delegate = self
        phoneNum3.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGestureAction(sender:)))
        self.containerView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
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
        self.validateAndSubmit()
    }
    
    func tapGestureAction(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstnameInput:
            textField.resignFirstResponder()
            lastnameInput.becomeFirstResponder()
        case lastnameInput:
            textField.resignFirstResponder()
            firstnameJpInput.becomeFirstResponder()
        case firstnameJpInput:
            textField.resignFirstResponder()
            lastnameJpInput.becomeFirstResponder()
        case lastnameJpInput:
            textField.resignFirstResponder()
            emailTextInput.becomeFirstResponder()
        case emailTextInput:
            textField.resignFirstResponder()
            birthdayInput.becomeFirstResponder()
        case birthdayInput:
            textField.resignFirstResponder()
            phoneNum1.becomeFirstResponder()
        case phoneNum1:
            textField.resignFirstResponder()
            phoneNum2.becomeFirstResponder()
        case phoneNum2:
            textField.resignFirstResponder()
            phoneNum3.becomeFirstResponder()
        case phoneNum3:
            textField.resignFirstResponder()
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
    
    func validateAndSubmit() {
        if (firstnameInput.text?.isEmpty)!
            || (lastnameInput.text?.isEmpty)!
            || (firstnameJpInput.text?.isEmpty)!
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
            printData()
            self.showAlert(title: "", message: "Đăng ký thành công")
        }
    }

    func printData() {
        print("Submit data:")
        print("Name: \(self.firstnameInput.text!) \(self.lastnameInput.text!)")
        print("Name Kata: \(self.firstnameJpInput.text!) \(self.lastnameJpInput.text!)")
        print("Email: \(self.emailTextInput.text!)")
        print("Birthday: \(self.birthdayInput.text!)")
        print("Sex: \(self.isMale == true ? "Male" : "Female")")
        print("Phonenumber: \(self.phoneNum1.text!) \(self.phoneNum2.text!) \(self.phoneNum2.text!)")
    }
}

