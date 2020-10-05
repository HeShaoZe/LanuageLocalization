//
//  ChangeSystemLanguageVC.swift
//  LanuageLocalization
//
//  Created by Ze Shao on 2020/10/5.
//  Copyright © 2020 Ze Shao. All rights reserved.
//

import UIKit

class ChangeSystemLanguageVC: UIViewController {

    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var clickButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickButton.titleLabel?.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func systemLanuage(_ sender: Any) {
        let alertController=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel=UIAlertAction(title:"取消", style: .cancel, handler: nil)
        let takingPictures=UIAlertAction(title:"拍照", style: .default){
            action in
            self.goCamera()
        }
        let localPhoto=UIAlertAction(title:"相册", style: .default){
            action in
            self.goImage()
        }
        alertController.addAction(cancel)
        alertController.addAction(takingPictures)
        alertController.addAction(localPhoto)
        self.present(alertController, animated:true, completion:nil)
    }
    

    /// 去拍照
    func goCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let  cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.modalPresentationStyle = .fullScreen
            cameraPicker.sourceType = .camera
            //在需要的地方present出来
            self.present(cameraPicker, animated: true, completion: nil)
        } else {
            print("不支持拍照")
        }
    }
    /// 去相册
    func goImage(){
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.modalPresentationStyle = .fullScreen
        photoPicker.sourceType = .photoLibrary
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }
}


extension ChangeSystemLanguageVC : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
          self.dismiss(animated: true, completion: nil)
    }
    
     //图片代理回调
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("获得照片============= \(info)")
        let image : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        self.contentImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
