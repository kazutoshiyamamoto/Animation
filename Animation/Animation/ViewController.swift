//
//  ViewController.swift
//  Animation
//
//  Created by home on 2018/03/21.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // flowerを作る
        let flower = UIImageView(image: UIImage(named: "flower"))
        // 透明度を0にする
        flower.alpha = 0
        
        // 0.2倍サイズにする
        let scaleTransform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        // -π/2 回転する
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        // トランスフォームを足し合わせる
        let transform = scaleTransform.concatenating(rotationTransform)
        // flowerを変形させる
        flower.transform = transform
        
        // タップされた座標にflowerを追加する
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        // アニメーション
        UIView.animate(withDuration: 1.0, // １秒間で再生
                       delay: 0, // 待ち時間なし
                       options: [.curveEaseInOut], // イーズインアウト
                       animations: {
                        // 透明度を1にする
                        flower.alpha = 1.0
                        // 変形を戻す
                        flower.transform = .identity
        },
                       completion: nil)
    }
}

