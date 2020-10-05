//
//  ChangeContentLanguageVC.swift
//  LanuageLocalization
//
//  Created by Ze Shao on 2020/10/5.
//  Copyright © 2020 Ze Shao. All rights reserved.
//

import UIKit

class ChangeContentLanguageVC: UIViewController {

    @IBOutlet weak var contentLable: UILabel!
    
    @IBOutlet weak var lanuageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///如果之前没有设置语言就根据系统默认语言类型设置
        LanguageManagerTool.shareInstance.setDefaultLanguage()
        ///显示多语言
        contentLable.text = HSZLanguage(key: "世界你好")
    }

    
    @IBAction func selectLanuageType(_ sender: Any) {
        let alertController=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel=UIAlertAction(title:"取消", style: .cancel, handler: nil)
        let takingPictures=UIAlertAction(title:"英文", style: .default){ [weak self] action in
            ///设置语言
            LanguageManagerTool.shareInstance.setLanguage(langeuageType: .ENGLISH)
            self!.contentLable.text = HSZLanguage(key: "世界你好")
            self!.lanuageButton.setTitle("英文", for: .normal)
        }
        let localPhoto=UIAlertAction(title:"中文", style: .default){ [weak self] action in
            ///设置语言
            LanguageManagerTool.shareInstance.setLanguage(langeuageType: .CHINA)
            self!.contentLable.text = HSZLanguage(key: "世界你好")
            self!.lanuageButton.setTitle("中文", for: .normal)
        }
        alertController.addAction(cancel)
        alertController.addAction(takingPictures)
        alertController.addAction(localPhoto)
        self.present(alertController, animated:true, completion:nil)
    }
    
}
