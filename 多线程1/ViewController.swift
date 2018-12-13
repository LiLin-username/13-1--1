//
//  ViewController.swift
//  多线程1
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 李琳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var TimerLabel: UILabel!
    @IBOutlet var txtLabel: UILabel!//所有数相加的和
    var  count = 0  //用于计时
    override func viewDidLoad() {
        super.viewDidLoad()
        //Timer:定时器，计时器
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.count += 1
            self.TimerLabel.text = "\(self.count)"
            //print("timer thread:\(Thread.current)")//查看该程序在哪种线程中运行。
            }.fire()
    }
    
    @IBAction func caculate(_ sender: Any) {//实现所有数相加
        var sum = 0
        DispatchQueue.global().async {//多线程原理：封装一段代码，将该代码放在另外一个线程中执行。不会阻塞UI主线程
            print("Run thread:\(Thread.current)")
            for i in 1...9999999{
                //usleep(10000)//usleep函数能把进程挂起一段时间, 单位是微秒(千分之一毫秒)。本函数可暂时使程序停止执行
                sum += i
            }
            DispatchQueue.main.async {
                self.txtLabel.text = "sum:\(sum)"
                print("sum thread:\(Thread.current)")
            }
            
        }
}
}
