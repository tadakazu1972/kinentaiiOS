//
//  Guide3Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/11.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide3Dialog {
    //ボタン押したら出るUIWindow
    fileprivate var parent: UIViewController!
    fileprivate var win1: UIWindow!
    fileprivate var scroll: UIScrollView!
    fileprivate var text0: UITextView!
    fileprivate var image1: UIImageView!
    fileprivate var text1: UITextView!
    fileprivate var image2: UIImageView!
    fileprivate var btnClose: UIButton!
    
    //コンストラクタ
    init(parentView: UIViewController){
        parent = parentView
        win1 = UIWindow()
        scroll = UIScrollView()
        text0 = UITextView()
        image1 = UIImageView()
        text1 = UITextView()
        image2 = UIImageView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        scroll = nil
        text0 = nil
        image1 = nil
        image2 = nil
        text1 = nil
        btnClose = nil
    }
    
    //表示
    func showInfo(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.white
        win1.frame = CGRect(x: 80,y: 80,width: parent.view.frame.width-20,height: parent.view.frame.height-50)
        win1.layer.position = CGPoint(x: parent.view.frame.width/2, y: parent.view.frame.height/2+20)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKey()
        //表示
        self.win1.makeKeyAndVisible()
        
        //scroll生成
        scroll.frame = CGRect(x: 0,y: 0,width: parent.view.frame.width-20,height: parent.view.frame.height-50)
        scroll.contentSize = CGSize(width: 300,height: 500)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRect(x: 0,y: 0, width: 300, height: 30)
        text0.backgroundColor = UIColor.clear
        text0.font = UIFont.systemFont(ofSize: CGFloat(16))
        text0.textColor = UIColor.black
        text0.textAlignment = NSTextAlignment.left
        text0.isEditable = false
        text0.isScrollEnabled = true
        text0.text="３　各事象操作画面切り替え"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide31.png")
        image1.image = img1
        image1.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 40, width: 300, height: 113)
        scroll.addSubview(image1)
        
        //image2生成
        let img2 = UIImage(named: "guide32.png")
        image2.image = img2
        image2.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 168, width: 300, height: 113)
        scroll.addSubview(image2)
        
        //TextView1生成
        text1.frame = CGRect(x: 0,y: 280, width: parent.view.frame.width-20, height: 190)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(16))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.text="各事象操作画面の上部、基礎データ入力画面の上部に切り替えボタンがあります。\n\n各ボタンをタップすることにより震災、風水害、国民保護、緊援隊の事象操作画面に切り替えることができます。"
        scroll.addSubview(text1)
        
        //閉じるボタン生成
        btnClose.frame = CGRect(x: 0,y: 0,width: 100,height: 30)
        btnClose.backgroundColor = UIColor.orange
        btnClose.setTitle("閉じる", for: UIControl.State())
        btnClose.setTitleColor(UIColor.white, for: UIControl.State())
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPoint(x: self.win1.frame.width/2, y: self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), for: .touchUpInside)
        self.win1.addSubview(btnClose)
    }
    
    //閉じる
    @objc func onClickClose(_ sender: UIButton){
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
    }
}
