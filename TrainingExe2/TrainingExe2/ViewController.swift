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
    @IBOutlet weak var scrollView: UIScrollView!
    var activeField: UITextField? //* Lưu ý: Các đối tượng liên quan tới giao diện nên sử dụng weak để tránh retain cycles dẫn tới memory leaks
    
    var checkBox = UIImage(named: "ic-checked") //* Lưu ý: Với những biến có giá trị không thay đổi, nên dùng let không dùng var
    var uncheckBox = UIImage(named: "ic-unchecked") // Tương tự như trên
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
        
        self.registerForKeyboardNotifications()
    }
    
    deinit {
        self.deregisterFromKeyboardNotifications()
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
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
}

