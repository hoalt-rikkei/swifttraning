//
//  ViewController.swift
//  TrainingExe4
//
//  Created by ios developer on 7/27/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

struct AVResult {
    let captureDate: String!
    let avValue: Float!
    let loviValue: Int!
}

class ViewController: UIViewController {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var moveBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfAVResult = [AVResult]()
    var isListEditing = false
    var isListMoving = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfAVResult = [
            AVResult(captureDate: "2014-02-06", avValue: 2.1, loviValue: 279),
            AVResult(captureDate: "2015-06-06", avValue: 2.2, loviValue: 179),
            AVResult(captureDate: "2014-05-06", avValue: 2.1, loviValue: 139),
            AVResult(captureDate: "2016-07-06", avValue: 2.3, loviValue: 219),
            AVResult(captureDate: "2018-09-06", avValue: 2.1, loviValue: 119),
            AVResult(captureDate: "2015-05-06", avValue: 2.2, loviValue: 279),
            AVResult(captureDate: "2013-06-06", avValue: 2.1, loviValue: 329)
        ]
        
        self.title = "TrainingExe4"
        
        self.tableViewOption()
    }
    
    func tableViewOption() {
        //* Gợi ý: Những thiết lập riêng cho từng thành phần (ví dụ như table view) nên để riêng ra 1 hàm
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "AVViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "avViewCell")
        
        self.tableView.estimatedRowHeight = 200.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    
    // MARK: - action
    
    @IBAction func editBtnClick(_ sender: Any) {
        if isListMoving {
            self.moveAction()
        }
        self.editAction()
    }
    
    @IBAction func moveBtnClick(_ sender: Any) {
        if isListEditing {
            self.editAction()
        }
        self.moveAction()
    }
    
    func editAction() {
        isListEditing = !isListEditing
        if (isListEditing) {
            editBtn.title = "Done"
        } else {
            editBtn.title = "Edit"
        }
    }
    
    func moveAction() {
        isListMoving = !isListMoving
        if (isListMoving) {
            moveBtn.title = "Done"
        } else {
            moveBtn.title = "Move"
        }
        self.tableView.setEditing(isListMoving, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    // item click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let clickedObject = self.arrayOfAVResult[indexPath.row]
        tableView.cellForRow(at: indexPath)
        if (indexPath.row + 1) % 2 == 0 {
            let destController = self.storyboard?.instantiateViewController(withIdentifier: "newViewController") as! NewViewController
            self.navigationController?.pushViewController(destController, animated: true)
        } else {
            let destController = self.storyboard?.instantiateViewController(withIdentifier: "newViewController") as! NewViewController
            //destController.modalTransitionStyle = .partialCurl
            self.present(destController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return isListEditing ? .delete : UITableViewCellEditingStyle.none
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfAVResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "avViewCell", for: indexPath) as! AVViewCell
        cell.commonInit(
            imageName: "thumb",
            captureString: arrayOfAVResult[indexPath.item].captureDate,
            avString: "AV \(arrayOfAVResult[indexPath.item].avValue!)",
            loviString: "WA \(arrayOfAVResult[indexPath.item].loviValue!)"
        )
        return cell
    }
    
    // swipe to delete item
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return isListMoving ? isListMoving : isListEditing
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            print("Delete")
            self.arrayOfAVResult.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // move item
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return isListMoving
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.arrayOfAVResult[sourceIndexPath.row]
        arrayOfAVResult.remove(at: sourceIndexPath.row)
        arrayOfAVResult.insert(movedObject, at: destinationIndexPath.row)
    }
}
