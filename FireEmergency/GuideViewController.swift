//
//  GuideViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/26.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    //メイン画面
    let btnData         = UIButton(frame: CGRect.zero)
    let btnBack            = UIButton(frame: CGRect.zero)
    let lblGuide        = UILabel(frame: CGRect.zero)
    let btnGuide1       = UIButton(frame: CGRect.zero)
    let btnGuide2       = UIButton(frame: CGRect.zero)
    let btnGuide3       = UIButton(frame: CGRect.zero)
    let btnGuide4       = UIButton(frame: CGRect.zero)
    let btnGuide5       = UIButton(frame: CGRect.zero)
    let btnGuide6       = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let padY6           = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mBousainetDialog: BousainetDialog!
    fileprivate var mGuide5Dialog: Guide5Dialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //Button生成
        //使用目的
        btnData.backgroundColor = UIColor.blue
        btnData.layer.masksToBounds = true
        btnData.setTitle("参集アプリの使用目的", for: UIControl.State())
        btnData.setTitleColor(UIColor.white, for: UIControl.State())
        btnData.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.showPurpose(_:)), for: .touchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //震災
        btnBack.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnBack.layer.masksToBounds = true
        btnBack.setTitle("戻る", for: UIControl.State())
        btnBack.setTitleColor(UIColor.black, for: UIControl.State())
        btnBack.tag=1
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.addTarget(self, action: #selector(self.onClickbtnBack(_:)), for: .touchUpInside)
        self.view.addSubview(btnBack)
        //アプリ説明書
        lblGuide.text = "アプリ説明書"
        lblGuide.textColor = UIColor.black
        lblGuide.textAlignment = NSTextAlignment.center
        lblGuide.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblGuide)
        
        //説明５
        btnGuide5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide5.layer.masksToBounds = true
        btnGuide5.setTitle("情報確認ボタン", for: UIControl.State())
        btnGuide5.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide5.translatesAutoresizingMaskIntoConstraints = false
        btnGuide5.addTarget(self, action: #selector(self.showGuide5(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide5)
    

        //垂直方向のpad
        padY1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY1)
        padY2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY2)
        padY3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY3)
        padY4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY4)
        padY5.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY5)
        padY6.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY6)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mBousainetDialog = BousainetDialog(parentView: self)
        mGuide5Dialog = Guide5Dialog(parentView: self)
    }
    
    //制約ひな型
    func Constraint(_ item: AnyObject, _ attr: NSLayoutConstraint.Attribute, to: AnyObject?, _ attrTo: NSLayoutConstraint.Attribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint {
        let ret = NSLayoutConstraint(
            item:       item,
            attribute:  attr,
            relatedBy:  relate,
            toItem:     to,
            attribute:  attrTo,
            multiplier: multiplier,
            constant:   constant
        )
        ret.priority = priority
        return ret
    }
    
    override func viewDidLayoutSubviews(){
        //制約
        self.view.addConstraints([
            //基礎データ入力ボタン
            Constraint(btnData, .top, to:self.view, .top, constant:20),
            Constraint(btnData, .leading, to:self.view, .leading, constant:8),
            Constraint(btnData, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
        self.view.addConstraints([
            //戻るボタン
            Constraint(btnBack, .top, to:btnData, .bottom, constant:8),
            Constraint(btnBack, .centerX, to:self.view, .centerX, constant:0),
            Constraint(btnBack, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //アプリ説明書ラベル
            Constraint(lblGuide, .bottom, to:self.view, .centerY, constant:-100),
            Constraint(lblGuide, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblGuide, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //説明５ボタン
            Constraint(btnGuide5, .top, to:lblGuide, .bottom, constant:20),
            Constraint(btnGuide5, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide5, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
    }
    
    //参集アプリの使用目的
    @objc func showPurpose(_ sender: UIButton){
        mInfoDialog.showInfo("purpose")
    }
    
    //説明５
    @objc func showGuide5(_ sender: UIButton){
        mGuide5Dialog.showInfo()
    }
   
    //戻る
    @objc func onClickbtnBack(_ sender : UIButton){
        self.dismiss(animated: true)
        mViewController.view.alpha = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
