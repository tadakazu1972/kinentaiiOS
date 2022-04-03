//
//  Guide21Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/20.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide21Dialog {
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
    fileprivate var image5: UIImageView!
    fileprivate var text5: UITextView!
    fileprivate var image6: UIImageView!
    fileprivate var text6: UITextView!
    fileprivate var image7: UIImageView!
    fileprivate var text7: UITextView!
    fileprivate var image8: UIImageView!
    fileprivate var text8: UITextView!
    fileprivate var image9: UIImageView!
    fileprivate var text9: UITextView!
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
        image5 = UIImageView()
        text5 = UITextView()
        image6 = UIImageView()
        text6 = UITextView()
        image7 = UIImageView()
        text7 = UITextView()
        image8 = UIImageView()
        text8 = UITextView()
        image9 = UIImageView()
        text9 = UITextView()
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
        image5 = nil
        text5 = nil
        image6 = nil
        text6 = nil
        image7 = nil
        text7 = nil
        image8 = nil
        text8 = nil
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
        scroll.contentSize = CGSize(width: 300,height: 4100)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRect(x: 0,y: 0, width: 300, height: 30)
        text0.backgroundColor = UIColor.clear
        text0.font = UIFont.systemFont(ofSize: CGFloat(16))
        text0.textColor = UIColor.black
        text0.textAlignment = NSTextAlignment.left
        text0.isEditable = false
        text0.isScrollEnabled = true
        text0.text="２　連絡網データ操作"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide211.png")
        image1.image = img1
        image1.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 40, width: 300, height: 426)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRect(x: 0,y: 486, width: parent.view.frame.width-20, height: 80)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(16))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.text="連絡網データ操作ボタンは基礎データ入力画面の下部にあります。"
        scroll.addSubview(text1)
        
        //image2生成
        let img2 = UIImage(named: "guide212.png")
        image2.image = img2
        image2.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 586, width: 300, height: 426)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRect(x: 0,y: 1046, width: parent.view.frame.width-20, height: 100)
        text2.backgroundColor = UIColor.clear
        text2.font = UIFont.systemFont(ofSize: CGFloat(16))
        text2.textColor = UIColor.black
        text2.textAlignment = NSTextAlignment.left
        text2.isEditable = false
        text2.isScrollEnabled = true
        text2.text="招集連絡に必要なデータ入力を行います。\n新規をタップします。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide213.png")
        image3.image = img3
        image3.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 1146, width: 300, height: 426)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRect(x: 0,y: 1592, width: parent.view.frame.width-20, height: 120)
        text3.backgroundColor = UIColor.clear
        text3.font = UIFont.systemFont(ofSize: CGFloat(16))
        text3.textColor = UIColor.black
        text3.textAlignment = NSTextAlignment.left
        text3.isEditable = false
        text3.isScrollEnabled = true
        text3.text="画面に必要な情報を入力または選択します。\n全ての項目に入力が終われば「登録」をタップします。\nこれで登録完了です。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide214.png")
        image4.image = img4
        image4.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 1720, width: 300, height: 146)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRect(x: 0, y: 1886, width: parent.view.frame.width-20, height: 80)
        text4.backgroundColor = UIColor.clear
        text4.font = UIFont.systemFont(ofSize: CGFloat(16))
        text4.textColor = UIColor.black
        text4.textAlignment = NSTextAlignment.left
        text4.isEditable = false
        text4.isScrollEnabled = true
        text4.text="登録したデータは一覧ボタンをタップし確認してください。"
        scroll.addSubview(text4)
        
        //image5生成
        let img5 = UIImage(named: "guide63.png")
        image5.image = img5
        image5.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 1966, width: 300, height: 195)
        scroll.addSubview(image5)
        
        //TextView5生成
        text5.frame = CGRect(x: 0, y: 2161, width: parent.view.frame.width-20, height: 100)
        text5.backgroundColor = UIColor.clear
        text5.font = UIFont.systemFont(ofSize: CGFloat(16))
        text5.textColor = UIColor.black
        text5.textAlignment = NSTextAlignment.left
        text5.isEditable = false
        text5.isScrollEnabled = true
        text5.text="画面にパスワードを入力します。\n「入力」をタップすると一覧表が表示されます。"
        scroll.addSubview(text5)
        
        //image6生成
        let img6 = UIImage(named: "guide65.png")
        image6.image = img6
        image6.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 2260, width: 300, height: 426)
        scroll.addSubview(image6)
        
        //TextView6生成
        text6.frame = CGRect(x: 0, y: 2706, width: parent.view.frame.width-20, height: 80)
        text6.backgroundColor = UIColor.clear
        text6.font = UIFont.systemFont(ofSize: CGFloat(16))
        text6.textColor = UIColor.black
        text6.textAlignment = NSTextAlignment.left
        text6.isEditable = false
        text6.isScrollEnabled = true
        text6.text="電話番号、メールアドレスのタップで電話、メール送信が行えます。"
        scroll.addSubview(text6)
        
        //image7生成
        let img7 = UIImage(named: "guide217.png")
        image7.image = img7
        image7.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 2786, width: 300, height: 231)
        scroll.addSubview(image7)
        
        //TextView7生成
        text7.frame = CGRect(x: 0, y: 3016, width: parent.view.frame.width-20, height: 80)
        text7.backgroundColor = UIColor.clear
        text7.font = UIFont.systemFont(ofSize: CGFloat(16))
        text7.textColor = UIColor.black
        text7.textAlignment = NSTextAlignment.left
        text7.isEditable = false
        text7.isScrollEnabled = true
        text7.text="連絡網データの修正が必要な場合は「修正」ボタンをタップします。"
        scroll.addSubview(text7)

        //image8生成
        let img8 = UIImage(named: "guide63.png")
        image8.image = img8
        image8.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 3096, width: 300, height: 195)
        scroll.addSubview(image8)
        
        //TextView8生成
        text8.frame = CGRect(x: 0, y: 3300, width: parent.view.frame.width-20, height: 100)
        text8.backgroundColor = UIColor.clear
        text8.font = UIFont.systemFont(ofSize: CGFloat(16))
        text8.textColor = UIColor.black
        text8.textAlignment = NSTextAlignment.left
        text8.isEditable = false
        text8.isScrollEnabled = true
        text8.text="画面にパスワードを入力します。\n「入力」をタップすると一覧表が表示されます。"
        scroll.addSubview(text8)
        
        //image9生成
        let img9 = UIImage(named: "guide219.png")
        image9.image = img9
        image9.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 3400, width: 300, height: 426)
        scroll.addSubview(image9)

        //TextView9生成
        text9.frame = CGRect(x: 0, y: 3846, width: parent.view.frame.width-20, height: 110)
        text9.backgroundColor = UIColor.clear
        text9.font = UIFont.systemFont(ofSize: CGFloat(16))
        text9.textColor = UIColor.black
        text9.textAlignment = NSTextAlignment.left
        text9.isEditable = false
        text9.isScrollEnabled = true
        text9.text="内容を修正し「登録」をタップします。\n\n削除が必要な場合は前の画面で「削除」をタップし、削除したいデータを選択してください。"
        scroll.addSubview(text9)
        
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
