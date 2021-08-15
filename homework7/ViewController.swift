//
//  ViewController.swift
//  homework7
//
//  Created by 楊昕蕾 on 2021/8/14.
//

import UIKit

class ViewController: UIViewController {

    let animationImgView = UIImageView(frame: CGRect(x: 60, y: 230, width: 300, height: 300))
    
    let wishView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    let emitterLayer = CAEmitterLayer()
    
    
    @IBOutlet weak var blowOutButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var wishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(animationImgView)
        view.addSubview(wishView)
        view.addSubview(blowOutButton)
        view.addSubview(wishButton)
        view.addSubview(resetButton)
        
        
        var emitterCell: [CAEmitterCell] = []
                
        for index in 0...8{
        
        let cell = CAEmitterCell()
        
        cell.contents = UIImage(named: getImg(index: index))?.cgImage
        cell.birthRate = 5
        cell.lifetime = 5
        cell.velocity = 100
        cell.scale = 0.4
        cell.scaleRange = 0.2
        cell.color = getColor(index: index).cgColor

        cell.spin = 3.5
        cell.spinRange = 0.3
        
        cell.yAcceleration = 100
        cell.emissionLongitude = .pi * 0.5
        
        emitterCell.append(cell)
            
        }
        

        emitterLayer.emitterCells = emitterCell
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.width * 0.5, y: 0)
        emitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        
        
        wishView.layer.addSublayer(emitterLayer)
        
        
        func getImg(index: Int)->String{
            if index < 3{
                return "rectangle"
            }
            else if index > 3 && index <= 6{
                return "triangle"
            }
            else{
                return "heart"
            }
        }

//設置隨機顏色的方法
//        func getColor(index: Int)->UIColor{
//            let colors = [UIColor(red: 187/255, green: 229/255, blue: 237/255, alpha: 1), UIColor(red: 255/255, green: 200/255, blue: 87/255, alpha: 1), UIColor(red: 250/255, green: 205/255, blue: 210/255, alpha: 1)]
            
//            return colors.randomElement()!
//        }
        
        func getColor(index: Int)->UIColor{
            
            if index < 3{
                return UIColor(red: 187/255, green: 229/255, blue: 237/255, alpha: 1)
            }
            else if index > 3 && index <= 6{
                return UIColor(red: 255/255, green: 200/255, blue: 87/255, alpha: 1)
            }
            else{
                return UIColor(red: 250/255, green: 205/255, blue: 210/255, alpha: 1)
            }
        }
        

        
        //蛋糕動畫
        var cakeImg = [UIImage]()
        for i in 0...19 {
            cakeImg.append(UIImage(named: "birthdaycake-\(i)")!)
        }
        animationImgView.animationImages = cakeImg
        animationImgView.image = cakeImg.first
        animationImgView.animationRepeatCount = 1
        animationImgView.animationDuration = 1.5
                    
    }

    @IBAction func blowOut(_ sender: Any) {
        
        animationImgView.startAnimating()
        animationImgView.image = UIImage(named: "birthdaycake-19")
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 1, animations: {self.wishView.alpha = 0})

    }
    
    
    @IBAction func reset(_ sender: Any) {
        
        animationImgView.image = UIImage(named: "birthdaycake-0")
        
    }
    
    
    @IBAction func wish(_ sender: Any) {
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, animations: {self.wishView.alpha = 1})
    }
    
    
}

