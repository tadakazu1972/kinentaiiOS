//
//  KokuminhogoResultDialog.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/11/06.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KokuminhogoResultDialog {
    //ボタン押したら出るUIWindow
    fileprivate var parent: KokuminhogoViewController!
    fileprivate var win1: UIWindow!
    fileprivate var text1: UITextView!
    fileprivate var btnClose: UIButton!
    
    //コンストラクタ
    init(parentView: KokuminhogoViewController){
        parent = parentView
        win1 = UIWindow()
        text1 = UITextView()
        btnClose = UIButton()
    }
    
    //デコンストラクタ
    deinit{
        parent = nil
        win1 = nil
        text1 = nil
        btnClose = nil
    }
    
    //表示
    func showResult(_ data :Int){
        //元の画面を暗く
        parent.view.alpha = 0.3
        mViewController.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.white
        win1.frame = CGRect(x: 80,y: 180,width: parent.view.frame.width-40,height: parent.view.frame.height*0.8)
        win1.layer.position = CGPoint(x: parent.view.frame.width/2, y: parent.view.frame.height/2+72) //+72子ViewController調整
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKey()
        //表示
        self.win1.makeKeyAndVisible()
        
        //TextView生成
        text1.frame = CGRect(x: 10,y: 10, width: self.win1.frame.width - 20, height: self.win1.frame.height-60)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(18))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.dataDetectorTypes = .link
        
        //テキストの内容を場合分け
        switch data {
        //１号非常招集
        case 1:
            //テキストファイル読込
            let path = Bundle.main.path(forResource: "kokuminhogo1", ofType: "txt")!
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //２号非常招集
        case 2:
            //テキストファイル読込
            let path = Bundle.main.path(forResource: "kokuminhogo2", ofType: "txt")!
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //３号非常招集
        case 3:
            //テキストファイル読込
            let path = Bundle.main.path(forResource: "kokuminhogo3", ofType: "txt")!
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //４号非常招集
        case 4:
            //テキストファイル読込
            let path = Bundle.main.path(forResource: "kokuminhogo4", ofType: "txt")!
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
        //５号非常招集
        case 5:
            //テキストファイル読込
            let path = Bundle.main.path(forResource: "kokuminhogo5", ofType: "txt")!
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
                if text1.text=="" { //これしないと毎回ファイルを読み込んでスクロールすると下とカブる
                    text1.text = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                }
            } else {
                text1.text = "ファイル読込エラー"
            }
            break
            
        default:
            text1.text=""
        }
        
        self.win1.addSubview(text1)
        
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
        mViewController.view.alpha = 1.0 //明るく
    }
}
