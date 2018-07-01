//
//  SecondViewController.swift
//  PCbuildApp
//
//  Created by 松井信太郎 on 2018/06/30.
//  Copyright © 2018年 Shintaro.Matusi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {

    //@IBOutlet weak var apiout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: UIButtonType.system)
        // ボタンを押した時に実行するメソッドを指定
        button.addTarget(self, action: #selector(self.goNext(_:)), for: UIControlEvents.touchUpInside)
        // ラベルを設定する
        button.setTitle("CPU", for: UIControlState.normal)
        // 位置を決める
        button.frame = CGRect(x:view.frame.width*0.05, y:view.frame.height*0.1,
                              width:view.frame.width*0.9, height:view.frame.height*0.15)
        button.backgroundColor=UIColor(red: 0/255, green: 249/255, blue: 213/255, alpha: 1.0)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.layer.cornerRadius = 5.0
        // viewに追加する
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getdata(_ after:@escaping (JSON) -> ()){
        Alamofire.request("http://localhost:8080/sample2.php").responseJSON { response in
            let json = JSON(response.result.value ?? [])
            after(json)
        }
    }
    
    @IBAction func goNext(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "cpuview")
        self.present(next,animated: true, completion: nil)
    }
    
    func update(){
        
    }
    
}

