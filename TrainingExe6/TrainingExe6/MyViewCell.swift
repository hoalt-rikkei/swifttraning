//
//  MyViewCell.swift
//  TrainingExe6
//
//  Created by ios developer on 8/4/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class MyViewCell: UICollectionViewCell {
    var imageViewBack: UIImageView!
    var imageViewFront: UIImageView!
    let pokeBackTag: Int = 0
    let pokeFrontTag: Int = 1
    var pokeViews : (frontView: UIImageView, backView: UIImageView)?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewBack = self.createPokeViewWithImage(imageName: "p1.jpg", tag: self.pokeBackTag)
        imageViewFront = self.createPokeViewWithImage(imageName: "front.png", tag: self.pokeFrontTag)
        pokeViews = (frontView: imageViewFront,backView:imageViewBack)
        contentView.addSubview(imageViewBack)
        
        let swipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(flipPokeAnimation))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.left
        self.addGestureRecognizer(swipeGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipPokeAnimation))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func createPokeViewWithImage(imageName: String, tag: Int) ->UIImageView{
        let newPokeImageView = UIImageView(frame: self.frame)
        newPokeImageView.image = UIImage(named: imageName)
        newPokeImageView.tag = tag
        return newPokeImageView
    }
    
    // MARK: Flip Animation Setup
    
    func flipPokeAnimation(){
        if (imageViewBack.superview != nil) {
            pokeViews = (frontView: imageViewFront,backView:imageViewBack)
        }else{
            pokeViews = (frontView: imageViewBack,backView:imageViewFront)
        }
        let transitionOptions = UIViewAnimationOptions.transitionFlipFromLeft
        UIView.transition(with: self.contentView, duration: 0.5, options: transitionOptions, animations: {
            self.pokeViews!.backView.removeFromSuperview()
            self.contentView.addSubview(self.pokeViews!.frontView)
        }, completion: nil)
    }
}
