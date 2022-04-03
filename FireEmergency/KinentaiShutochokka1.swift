// 2018-09-26 作成

//
//  KinentaiNankaitraf1.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/18.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiShutochokka1 : UITextField {
    //ボタン押したら出るUIWindow
    fileprivate var parent: KinentaiViewController!
    fileprivate var win1: UIWindow!
    fileprivate var text1: UITextView!
    fileprivate var btnClose: UIButton!
    fileprivate var btnAction: UIButton!
    fileprivate var mKinentaiResultDialog: KinentaiResultDialog!
    //fileprivate var mKinentaiSelectDialog: KinentaiSelectDialog!  //2018-09-26 追加->2019-02-03 削除
    fileprivate var mKinentaiSelectDialog3: KinentaiSelectDialog3! //2019-02-03 追加
    
    //UITextFieldを便宜的に親として継承しているため。UIViewControllerを継承したくないための策。
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //コンストラクタ
    init(parentView: KinentaiViewController){
        super.init(frame: CGRect.zero)
        
        parent      = parentView
        win1        = UIWindow()
        text1       = UITextView()
        btnClose    = UIButton()
        btnAction   = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent      = nil
        win1        = nil
        text1       = nil
        btnClose    = nil
        btnAction   = nil
    }
    
    //表示
    func showResult(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        mViewController.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.white
        win1.frame = CGRect(x: 80,y: 10,width: parent.view.frame.width-40,height: parent.view.frame.height)
        win1.layer.position = CGPoint(x: parent.view.frame.width/2, y: parent.view.frame.height/2+72)
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKey()
        //表示
        self.win1.makeKeyAndVisible()
        
        //１セット目
        //text1生成
        text1.frame = CGRect(x: 10,y: 10, width: self.win1.frame.width - 20, height: self.win1.frame.height-60)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(18))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.dataDetectorTypes = .link
        text1.text = "首都直下地震アクションプラン\n\n東京23区において、震度6強以上が観測された場合"
        self.win1.addSubview(text1)
        
        //閉じるボタン生成
        btnClose.frame = CGRect(x: 0,y: 0,width: 100,height: 30)
        btnClose.backgroundColor = UIColor.orange
        btnClose.setTitle("閉じる", for: UIControl.State())
        btnClose.setTitleColor(UIColor.white, for: UIControl.State())
        btnClose.layer.masksToBounds = true
        btnClose.layer.cornerRadius = 10.0
        btnClose.layer.position = CGPoint(x: self.win1.frame.width/2-60, y: self.win1.frame.height-20)
        btnClose.addTarget(self, action: #selector(self.onClickClose(_:)), for: .touchUpInside)
        self.win1.addSubview(btnClose)
        
        //判定ボタン生成
        btnAction.frame = CGRect(x: 0,y: 0,width: 100,height: 30)
        btnAction.backgroundColor = UIColor.red
        btnAction.setTitle("該当", for: UIControl.State())
        btnAction.setTitleColor(UIColor.white, for: UIControl.State())
        btnAction.layer.masksToBounds = true
        btnAction.layer.cornerRadius = 10.0
        btnAction.layer.position = CGPoint(x: self.win1.frame.width/2+60, y: self.win1.frame.height-20)
        btnAction.addTarget(self, action: #selector(self.onClickAction(_:)), for: .touchUpInside)
        self.win1.addSubview(btnAction)
    }
    
    //閉じる
    @objc func onClickClose(_ sender: UIButton){
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        mViewController.view.alpha = 1.0
    }
    
    //判定
    @objc func onClickAction(_ sender: UIButton){
        win1.isHidden = true      //win1隠す
        text1.text = ""         //使い回しするのでテキスト内容クリア
        parent.view.alpha = 1.0 //元の画面明るく
        //対応の結果であるアクションプランを表示
        //2019-02-03 修正
        /*mKinentaiSelectDialog = KinentaiSelectDialog(index: 32, parentView: parent)
        mKinentaiSelectDialog.showInfo()*/
        mKinentaiSelectDialog3 = KinentaiSelectDialog3(index: 2, parentView: parent)
        mKinentaiSelectDialog3.showInfo()
    }
}
