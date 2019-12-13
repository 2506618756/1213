//
//  ViewController.swift
//  issue
//
//  Created by S20181105302 on 2019/11/29.
//  Copyright © 2019 s20181105302. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var progressV:ProgressV!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressV = ProgressV.init(frame: CGRect.init(x: 0, y: 620, width: self.view.frame.size.width, height: 20), dataArr: ["1","2","3","4","5","6","7","8","9","10","11","12","13"])
        self.view.addSubview(progressV)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var imgchangce: UIImageView!
    var cnt=0
    var img = "img"
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var sorce: UITextField!
    var sum = 0
    var ys = 0
    let ques = ["程序 = 数据结构 + 算法？","C语言是面向对象的编程语言？","Java是当前最流行的语言之一？","Linux比Windows更强大？","指针和引用是同一个意思？","C语言是编程语言比较难学的一门？","C语言比其他语言更适合做底层方面的开发？","Python语言20行代码能改变世界？","DOS系统是完全用命令运行的系统？","C语言正在被淘汰吗？","人工智能将会取代人类？","Java语言中没有指针？","学习计算机知识一定要有一台电脑？"]
    let trues = [1,0,1,0,0,1,1,0,1,0,0,0,0]
    @IBOutlet weak var yes: UITextField!
    
    
    @IBAction func trueflase(_ sender: Any) {
        if( trues[cnt]==1 )
        {
            sum += 1
        }
        else
        {
            sum -= 1
        }
        if( sum<0 )
        {
            sum = 0
        }
        cnt += 1
        yes.text = String(cnt) + "/13"
        question.text = ques[cnt]
    }

    @IBAction func yes(_ sender: Any) {
        if( trues[cnt]==1 )
        {
            sum += 1
            let alertController = UIAlertController(title: "你的答案",message: "正确", preferredStyle: .alert)
            
             let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in print("点击了是")})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            sum -= 1
            let alertController = UIAlertController(title: "你的答案",message: "错误", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in print("点击了否")})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        next()
    }
    
    @IBAction func no(_ sender: Any) {
        if( trues[cnt]==1 )
        {
            sum -= 1
            let alertController = UIAlertController(title: "你的答案",message: "错误", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in print("点击了否")})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            sum += 1
            let alertController = UIAlertController(title: "你的答案",message: "正确", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in print("点击了是")})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        next()
    }
    
    @IBOutlet weak var jindu: UIView!
    func next()
    {
        if( sum<0 )
        {
            sum = 0
        }
        cnt += 1
        if( cnt==13 )
        {
            cnt = 0
            sum = 0
        }
        yes.text = String(cnt+1) + "/13"
        progressV.index = progressV.index + 1
        if( progressV.index==13 )
        {
            progressV.index = 0
            jindu.frame.size.width = 0
            
        }
        sorce.text = String(sum)
        question.text = ques[cnt]
        jindu.frame.size.width = jindu.frame.size.width + view.frame.width / 13
        let s:String = img + String(cnt+1)
        imgchangce.image = UIImage(named: s)
    }
    
}

