//
//  AddViewController.swift
//  TrainingExe4
//
//  Created by ios developer on 8/2/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit
import CoreData

protocol ItemPassingDelegate {
    func itemAdded(item: AVResult);
}

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var captureDate: UITextField!
    @IBOutlet weak var avValue: UITextField!
    @IBOutlet weak var loviValue: UITextField!
    
    var datePicker: UIDatePicker!
    var delegate: ItemPassingDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add new"
        
        self.captureDate.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.captureDate)
    }

    //MARK: - action
    @IBAction func saveClick(_ sender: Any) {
        if delegate != nil {
            if ((captureDate.text?.characters.count)! > 0
                && (avValue.text?.characters.count)! > 0
                && (loviValue.text?.characters.count)! > 0) {
                let newAVResult = NSEntityDescription.insertNewObject(forEntityName: "AVResult", into: context)
                newAVResult.setValue(captureDate.text, forKey: "captureDate")
                newAVResult.setValue(Float (avValue.text!), forKey: "avValue")
                newAVResult.setValue(Int (loviValue.text!), forKey: "loviValue")
                
                do {
                    try context.save()
                    print("Saved!")
                }
                catch
                {
                    // Error
                }
                delegate?.itemAdded(item: newAVResult as! AVResult)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.showAlert(title: "Error", message: "Fill all field please!")
            }
        }
    }
    
    //Storing core data
    func storingData() {
        let newAVResult = NSEntityDescription.insertNewObject(forEntityName: "AVResult", into: context)
        newAVResult.setValue(captureDate.text, forKey: "captureDate")
        newAVResult.setValue(Float (avValue.text!), forKey: "avValue")
        newAVResult.setValue(Int (loviValue.text!), forKey: "loviValue")
        
        do {
            try context.save()
            print("Saved!")
        }
        catch
        {
            // Error
        }
    }
    
    func pickUpDate(_ captureDate: UITextField) {
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        captureDate.inputView = self.datePicker
        
        // Toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding button toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        captureDate.inputAccessoryView = toolBar
    }
    
    func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.captureDate.text = dateFormatter.string(from: datePicker.date)
        self.captureDate.resignFirstResponder()
    }
    
    func cancelClick() {
        self.captureDate.resignFirstResponder()
    }
    
    func showAlert(title: String, message: String) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        return true
    }
}
