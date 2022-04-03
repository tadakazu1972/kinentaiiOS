//
//  Guide44Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide44Dialog {
    //ボタン押したら出るUIWindow
    fileprivate var parent: UIViewController!
    fileprivate var win1: UIWindow!
    fileprivate var scroll: UIScrollView!
    fileprivate var text0: UITextView!
    fileprivate var image1: UIImageView!
    fileprivate var text1: UITextView!
    fileprivate var image2: UIImageView!
    fileprivate var text2: UITextView!
    fileprivate var image3: UIImageView!
    fileprivate var text3: UITextView!
    fileprivate var image4: UIImageView!
    fileprivate var text4: UITextView!
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
        text2 = UITextView()
        image3 = UIImageView()
        text3 = UITextView()
        image4 = UIImageView()
        text4 = UITextView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        scroll = nil
        text0 = nil
        image1 = nil
        text1 = nil
        image2 = nil
        text2 = nil
        image3 = nil
        text3 = nil
        image4 = nil
        text4 = nil
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
        scroll.contentSize = CGSize(width: 300,height: 1900)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRect(x: 0,y: 0, width: 300, height: 30)
        text0.backgroundColor = UIColor.clear
        text0.font = UIFont.systemFont(ofSize: CGFloat(16))
        text0.textColor = UIColor.black
        text0.textAlignment = NSTextAlignment.left
        text0.isEditable = false
        text0.isScrollEnabled = true
        text0.text="４　非常招集基準確認(緊援隊)"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide441.png")
        image1.image = img1
        image1.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 40, width: 300, height: 270)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRect(x: 0,y: 330, width: parent.view.frame.width-20, height: 284)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(16))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.text="上のボタンで緊急消防援助隊大阪府大隊の出場を確認することができます。\n地震については[地震(震央「陸」)][地震(震央「海域」)][アクションプラン]ボタンで確認することができます。\nその他[大津波・噴火][特殊災害(NBC含む)]の出場基準を確認することができます。\n\nまず、「和歌山県で震度６強、震央は陸」の地震が発生した場合の大阪府大隊の出場の可否について確認します。\n震央が「陸」なので[地震(震央)「陸」]ボタンをタップします。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide442.png")
        image2.image = img2
        image2.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 630, width: 300, height: 197)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRect(x: 0,y: 850, width: parent.view.frame.width-20, height: 80)
        text2.backgroundColor = UIColor.clear
        text2.font = UIFont.systemFont(ofSize: CGFloat(16))
        text2.textColor = UIColor.black
        text2.textAlignment = NSTextAlignment.left
        text2.isEditable = false
        text2.isScrollEnabled = true
        text2.text="次に、「震度６強」(特別区６弱)をタップします。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide443.png")
        image3.image = img3
        image3.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 950, width: 300, height: 267)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRect(x: 0,y: 1237, width: parent.view.frame.width-20, height: 80)
        text3.backgroundColor = UIColor.clear
        text3.font = UIFont.systemFont(ofSize: CGFloat(16))
        text3.textColor = UIColor.black
        text3.textAlignment = NSTextAlignment.left
        text3.isEditable = false
        text3.isScrollEnabled = true
        text3.text="次に、震央都道府県の「和歌山県」をタップします。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide444.png")
        image4.image = img4
        image4.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 1337, width: 300,height: 363)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRect(x: 0, y: 1720, width: parent.view.frame.width-20, height: 80)
        text4.backgroundColor = UIColor.clear
        text4.font = UIFont.systemFont(ofSize: CGFloat(16))
        text4.textColor = UIColor.black
        text4.textAlignment = NSTextAlignment.left
        text4.isEditable = false
        text4.isScrollEnabled = true
        text4.text="和歌山県への応援出動結果が表示されます。"
        scroll.addSubview(text4)
        
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
