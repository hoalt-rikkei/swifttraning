//
//  ViewController.swift
//  TrainingExe4
//
//  Created by ios developer on 7/27/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit
import CoreData

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class ViewController: UIViewController {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var moveBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfAVResult: Array<AVResult>!
    var isListEditing = false
    var isListMoving = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TrainingExe4"
        
        self.tableViewOption()

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AVResult")
        request.returnsObjectsAsFaults = false
        
        do {
            arrayOfAVResult = try context.fetch(request) as! Array<AVResult>
            if arrayOfAVResult.count > 0 {
                for result in arrayOfAVResult as [NSManagedObject] {
                    if let captureDate = result.value(forKey: "captureDate") as? String {
                        print(captureDate)
                    }
                }
            }
        } catch {
            // Error
        }
        
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
    
    
    @IBAction func addBtnClick(_ sender: Any) {
        let destController = self.storyboard?.instantiateViewController(withIdentifier: "addViewController") as! AddViewController
        destController.delegate = self
        self.navigationController?.pushViewController(destController, animated: true)
    }
    
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
    
    // date to string
    func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
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
            captureString: arrayOfAVResult[indexPath.item].captureDate!,
            avString: "AV \(arrayOfAVResult[indexPath.item].avValue)",
            loviString: "WA \(arrayOfAVResult[indexPath.item].loviValue)"
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

extension Date {
    
    init?(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        if let d = dateStringFormatter.date(from: dateString) {
            self.init(timeInterval: 0, since: d)
        } else {
            return nil
        }
    }
}

extension ViewController: ItemPassingDelegate {
    func itemAdded(item: AVResult) {
        arrayOfAVResult.insert(item, at: arrayOfAVResult.count)
        self.tableView.reloadData()
    }
}
