//
//  PassViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/03/14.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class PassViewController: UIViewController, UITextFieldDelegate {
    //メイン画面
    let lblPass         = UILabel(frame: CGRect.zero)
    let txtPass         = UITextField(frame: CGRect.zero)
    let btnSave         = UIButton(frame: CGRect.zero)
    let btnCancel       = UIButton(frame: CGRect.zero)
    //データ保存用
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //元の画面を暗く
        mViewController.view.alpha = 0.3
        mViewController2.view.alpha = 0.3
        //lblPass生成
        lblPass.text = "パスワード登録(変更不可)"
        lblPass.textColor = UIColor.black
        lblPass.textAlignment = NSTextAlignment.left
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblPass)
        
        //テキストフィールド
        txtPass.placeholder = "文字種別、文字数制限なし"
        txtPass.adjustsFontSizeToFitWidth = true
        txtPass.textColor = UIColor.black
        txtPass.delegate = self
        txtPass.borderStyle = UITextField.BorderStyle.bezel
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtPass)
        
        //キャンセルボタン
        btnCancel.backgroundColor = UIColor.blue
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitle("キャンセル", for: UIControl.State())
        btnCancel.setTitleColor(UIColor.white, for: UIControl.State())
        btnCancel.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        btnCancel.layer.cornerRadius = 8.0
        btnCancel.tag = 2
        btnCancel.addTarget(self, action: #selector(self.onClickbtnCancel(_:)), for: .touchUpInside)
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnCancel)
        //データ登録ボタン
        btnSave.backgroundColor = UIColor.red
        btnSave.layer.masksToBounds = true
        btnSave.setTitle("登録", for: UIControl.State())
        btnSave.setTitleColor(UIColor.white, for: UIControl.State())
        btnSave.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        btnSave.layer.cornerRadius = 8.0
        btnSave.tag = 1
        btnSave.addTarget(self, action: #selector(self.onClickbtnSave(_:)), for: .touchUpInside)
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnSave)        
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
            //text1
            Constraint(lblPass, .top, to:self.view, .top, constant:100),
            Constraint(lblPass, .leading, to:self.view, .leading, constant:16),
            Constraint(lblPass, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //テキストフィールド
            Constraint(txtPass, .top, to:lblPass, .bottom, constant:24),
            Constraint(txtPass, .leading, to:self.view, .leading, constant:16),
            Constraint(txtPass, .trailing, to:self.view, .trailing, constant:-16)
            ])
        self.view.addConstraints([
            //キャンセルボタン
            Constraint(btnCancel, .bottom, to:txtPass, .bottom, constant:48),
            Constraint(btnCancel, .leading, to:self.view, .leading, constant:8),
            Constraint(btnCancel, .trailing, to:self.view, .centerX, constant:-8)
            ])
        self.view.addConstraints([
            //登録ボタン
            Constraint(btnSave, .bottom, to:txtPass, .bottom, constant:48),
            Constraint(btnSave, .leading, to:self.view, .centerX, constant:8),
            Constraint(btnSave, .trailing, to:self.view, .trailing, constant:-8),
            ])
    }
    
    //登録ボタンクリック
    @objc func onClickbtnSave(_ sender : UIButton){
        //UserDefaultsに書き込み
        let pass: String = txtPass.text!
        userDefaults.set(pass, forKey: "password")
        
        //自己を破棄し、呼び出し元へ遷移
        self.dismiss(animated: true, completion: nil)
        
        //明るく
        mViewController.view.alpha = 1.0
        mViewController2.view.alpha = 1.0
    }
    
    //キャンセルボタンクリック
    @objc func onClickbtnCancel(_ sender : UIButton){
        //自己を破棄し、呼び出し元へ遷移
        self.dismiss(animated: true, completion: nil)
        //明るく
        mViewController.view.alpha = 1.0
        mViewController2.view.alpha = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
