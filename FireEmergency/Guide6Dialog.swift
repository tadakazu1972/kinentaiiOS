//
//  Guide6Dialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/05.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class Guide6Dialog {
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
        text5 = UITextView()
        image5 = UIImageView()
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
        scroll.contentSize = CGSize(width: 300,height: 2500)
        self.win1.addSubview(scroll)
        
        //TextView0生成
        text0.frame = CGRect(x: 0,y: 0, width: 300, height: 30)
        text0.backgroundColor = UIColor.clear
        text0.font = UIFont.systemFont(ofSize: CGFloat(16))
        text0.textColor = UIColor.black
        text0.textAlignment = NSTextAlignment.left
        text0.isEditable = false
        text0.isScrollEnabled = true
        text0.text="６　連絡網"
        scroll.addSubview(text0)
        
        //image1生成
        let img1 = UIImage(named: "guide61.png")
        image1.image = img1
        image1.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 40, width: 300, height: 96)
        scroll.addSubview(image1)
        
        //TextView1生成
        text1.frame = CGRect(x: 0,y: 150, width: parent.view.frame.width-20, height: 80)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(16))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.text="連絡網ボタンをタップすると\n①インストール後初回のみ、パスワード設定画面になります。"
        scroll.addSubview(text1)
        //image2生成
        let img2 = UIImage(named: "guide62.png")
        image2.image = img2
        image2.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 240, width: 300, height: 160)
        scroll.addSubview(image2)
        
        //TextView2生成
        text2.frame = CGRect(x: 0,y: 410, width: parent.view.frame.width-20, height: 80)
        text2.backgroundColor = UIColor.clear
        text2.font = UIFont.systemFont(ofSize: CGFloat(16))
        text2.textColor = UIColor.black
        text2.textAlignment = NSTextAlignment.left
        text2.isEditable = false
        text2.isScrollEnabled = true
        text2.text="②パスワードは変更できません。変更する場合はアプリを削除し、再度インストールしてください。"
        scroll.addSubview(text2)
        
        //image3生成
        let img3 = UIImage(named: "guide63.png")
        image3.image = img3
        image3.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 520, width: 300, height: 200)
        scroll.addSubview(image3)
        
        //TextView3生成
        text3.frame = CGRect(x: 0,y: 740, width: parent.view.frame.width-20, height: 220)
        text3.backgroundColor = UIColor.clear
        text3.font = UIFont.systemFont(ofSize: CGFloat(16))
        text3.textColor = UIColor.black
        text3.textAlignment = NSTextAlignment.left
        text3.isEditable = false
        text3.isScrollEnabled = true
        text3.text="③次回以降、設定したパスワードを入力すると連絡網を使用できます。\n④パスワードは[震災][風水害]などの同一画面では１度の入力で連絡網を使えますが、\n⑤画面を変える（[震災]→[風水害]など）またはアプリを終了すると再度入力する必要があります。\n⑥パスワードは変更できません。変更する場合はアプリを削除し、再度インストールして設定してください。"
        scroll.addSubview(text3)
        
        //image4生成
        let img4 = UIImage(named: "guide64.png")
        image4.image = img4
        image4.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 990, width: 300, height: 426)
        scroll.addSubview(image4)
        
        //TextView4生成
        text4.frame = CGRect(x: 0, y: 1436, width: parent.view.frame.width-20, height: 220)
        text4.backgroundColor = UIColor.clear
        text4.font = UIFont.systemFont(ofSize: CGFloat(16))
        text4.textColor = UIColor.black
        text4.textAlignment = NSTextAlignment.left
        text4.isEditable = false
        text4.isScrollEnabled = true
        text4.text="■データ全件一覧表示\n　データ全件一覧を表示させ、個別に電話、メール送信することが可能です。(メールは一斉送信可)\n\n■グループ検索\n　非常招集区分、所属(大分類)、所属(小分類)、勤務区分を選択し検索します。個別に電話、メール送信することが可能です。(メールは一斉送信可)"
        scroll.addSubview(text4)
        
        //image5生成
        let img5 = UIImage(named: "guide65.png")
        image5.image = img5
        image5.frame = CGRect(x: (parent.view.frame.width-320)/2, y: 1680, width: 300, height: 426)
        scroll.addSubview(image5)
        
        //TextView5生成
        text5.frame = CGRect(x: 0, y: 2120, width: parent.view.frame.width-20, height: 320)
        text5.backgroundColor = UIColor.clear
        text5.font = UIFont.systemFont(ofSize: CGFloat(16))
        text5.textColor = UIColor.black
        text5.textAlignment = NSTextAlignment.left
        text5.isEditable = false
        text5.isScrollEnabled = true
        text5.text="個別に電話する場合は電話番号をタップ、メール送信する場合はアドレスをタップします。\n\n選択する際には名前付近の行の中心をタップしてください。(チェックボックスはタップに反応しません)\n\n選択した人に一斉にメールすることが可能です。選択してからメール送信をタップすると、選択した人のメールアドレスがまとめて宛先に入った状態で、メール作成画面になります。"
        scroll.addSubview(text5)

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
