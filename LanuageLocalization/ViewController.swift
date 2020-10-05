//
//  ViewController.swift
//  LanuageLocalization
//
//  Created by Ze Shao on 2020/9/29.
//  Copyright © 2020 Ze Shao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    ///设置App内容的多语言
    @IBAction func changeContentLanuage(_ sender: Any) {
        let contentVC = ChangeContentLanguageVC.init(nibName: "ChangeContentLanguageVC", bundle: nil)
        self.navigationController?.pushViewController(contentVC, animated: true)
    }
    
    ///根据系统的多语言显示，例如App的多语言名字、访问相机摄像头提示多语言、访问麦克风多语言提示等等
    @IBAction func getSystemLanguage(_ sender: Any) {
        let contentVC = ChangeSystemLanguageVC.init(nibName: "ChangeSystemLanguageVC", bundle: nil)
        self.navigationController?.pushViewController(contentVC, animated: true)
    }
}


