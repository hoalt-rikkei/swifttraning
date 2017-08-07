//
//  ViewController.swift
//  TrainingExe6
//
//  Created by ios developer on 8/2/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var images = ["p1", "p2", "p3", "p4", "p5", "p6", "p1", "p2", "p3", "p4", "p5", "p6"]

    @IBOutlet weak var boardView: UICollectionView!
    @IBOutlet weak var timeProgress: UIProgressView!
    @IBOutlet weak var actionBtn: UIButton!
    
    var timer = Timer()
    var totalTime = 180
    var timeRemaining = 180
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TrainingExe6"
        self.boardView.delegate = self
        self.boardView.dataSource = self
        
        self.initView()
    }
    
    func initView() {
        timeProgress.setProgress(100, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! MyViewCell
        //cell.imageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! MyViewCell
        cell.flipPokeAnimation()
    }
    
    @IBAction func actionClick(_ sender: Any) {
        if isPlaying {
            timer.invalidate()
            actionBtn.setTitle("Play", for: UIControlState.normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
            actionBtn.setTitle("Pause", for: UIControlState.normal)
        }
        isPlaying = !isPlaying
    }
    
    func timerRunning() {
        timeRemaining -= 1
        timeProgress.setProgress(Float(timeRemaining)/Float(totalTime), animated: false)
    }
}
