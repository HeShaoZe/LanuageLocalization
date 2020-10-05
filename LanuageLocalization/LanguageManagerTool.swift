//
//  LanguageManagerTool.swift
//  LanuageLocalization
//
//  Created by Ze Shao on 2020/9/29.
//  Copyright © 2020 Ze Shao. All rights reserved.
//

import UIKit

enum LanguageManagerType : String
{
    //中国
    case CHINA = "zh-Hans"
    //英语
    case ENGLISH = "en"
    //马来西亚
    case MELAYU = "ms"
    //泰国
    case THAILAND = "th"
    //越南
    case VIETNAM = "vi"
    //菲律宾
    case THEPHILIPPINES = "fil"
    //印尼
    case INDONESIA = "id"
}

///获取多语言
func HSZLanguage(key : String) -> String{
    let languageVaule : String = LanguageManagerTool.getString(key: key)
    return languageVaule
}

class LanguageManagerTool: NSObject {
    ///存储关键字
    let UserLanguage : String = "UserLanguage"
    
    let AppleLanguages : String = "AppleLanguages"
    
    static let shareInstance = LanguageManagerTool()
    let def = UserDefaults.standard
    var bundle : Bundle?
    
    /* 根据关键字获取内容*/
    class func getString(key:String) -> String{
        let bundle = LanguageManagerTool.shareInstance.bundle
        let str = bundle?.localizedString(forKey: key, value: nil, table: nil)
        return str!
    }
        
    /// 设置语言样式
    func setLanguage(langeuageType :LanguageManagerType) {
        let langeuage : String = langeuageType.rawValue
        let path = Bundle.main.path(forResource:langeuage , ofType: "lproj")
        bundle = Bundle(path: path!)
        def.set(langeuage, forKey: UserLanguage)
        def.synchronize()
    }
    
    ///根据本地语言设置默认语言
    func setDefaultLanguage() {
        //获取本地app的语言
        let languages = def.object(forKey: AppleLanguages) as? NSArray
        if languages?.count != 0 {
            ///本地设备使用的语言
            let languageArray : Array<String> = UserDefaults.standard.object(forKey: "AppleLanguages") as! Array<String>
            var localLanguageString : String = ""
            if languageArray.count > 0 {
                localLanguageString = languageArray[0]
            }
            ///如果是中文就是转成zh-Hans
            if localLanguageString.range(of: "zh") != nil
            {
                localLanguageString = "zh-Hans"
            }
            if localLanguageString.range(of: "en") != nil {
                localLanguageString = "en"
            }
            ///设置语言类型
            let path = Bundle.main.path(forResource:localLanguageString, ofType: "lproj")
            print("pathFJDFID----\(path ?? "")")
            bundle = Bundle(path: path!)
            def.set(localLanguageString, forKey: UserLanguage)
            def.synchronize()
        }
    }
}
