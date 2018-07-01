//
//  showCPUViewController.swift
//  PCbuildApp
//
//  Created by 松井信太郎 on 2018/06/30.
//  Copyright © 2018年 Shintaro.Matusi. All rights reserved.
//

import UIKit
import SwiftyJSON

class showCPUViewController: UIViewController {

    //@IBOutlet weak var cpuout: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.cpuout.numberOfLines=0
        let label = UILabel()
        label.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        label.backgroundColor = UIColor.darkGray
        label.alpha=0.4
        self.view.addSubview(label)
        var i=0
        SecondViewController().getdata({ json in
            //self.cpuout.text=""
            while true {
                if(i>15){
                    break
                }
                //print(json["name"][i])
                //self.cpuout.text=self.cpuout.text!+json["name"][i].stringValue+"\n"
                
                let button = UIButton(type: UIButtonType.system)
                // ボタンを押した時に実行するメソッドを指定
                button.addTarget(self, action: #selector(self.buttonEvent(_:)), for: UIControlEvents.touchUpInside)
                // ラベルを設定する
                button.setTitle("+", for: UIControlState.normal)
                // 位置を決める
                //button.layer.position = CGPoint(x: self.view.frame.width/1.1, y:self.view.frame.height*0.215+CGFloat(i*20))
                button.frame = CGRect(x:self.view.frame.width*0.05, y:self.view.frame.height*0.2+CGFloat(i*20), width:self.view.frame.size.width*0.91, height:25)
                //タグを指定する
                button.tag = i
                button.backgroundColor=UIColor.white
                button.contentHorizontalAlignment = .right
                button.layer.cornerRadius = 5.0
                // viewに追加する
                self.view.addSubview(button)
                
                
                let label = UILabel()
                label.frame = CGRect(x:self.view.frame.width*0.05, y:self.view.frame.height*0.2+CGFloat(i*20), width:self.view.frame.size.width*0.8, height:25)
                label.textAlignment = NSTextAlignment.left
                label.text = json["name"][i].stringValue+"  "+json["price"][i].stringValue
                //label.backgroundColor = UIColor.white
                label.adjustsFontSizeToFitWidth = true
                label.textColor=UIColor.darkGray
                self.view.addSubview(label)
                i+=1
            }
            let button = UIButton(type: UIButtonType.system)
            // ボタンを押した時に実行するメソッドを指定
            button.addTarget(self, action: #selector(self.back(_:)), for: UIControlEvents.touchUpInside)
            // ラベルを設定する
            button.setTitle("戻る", for: UIControlState.normal)
            // 位置を決める
            button.frame = CGRect(x:self.view.frame.width*0.05, y:self.view.frame.height*0.2+CGFloat((i)*20), width:self.view.frame.size.width*0.91, height:25)
            button.layer.cornerRadius = 5.0
            button.backgroundColor=UIColor.white
            // viewに追加する
            self.view.addSubview(button)
        })
    }
    @objc func buttonEvent(_ sender: UIButton) {
        print("ボタンの情報: \(sender.tag)")
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
