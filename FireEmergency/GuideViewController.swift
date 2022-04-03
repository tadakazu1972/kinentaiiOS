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
    fileprivate var mEarthSelectDialog: EarthSelectDialog!
    fileprivate var mContactLoadDialog: ContactLoadDialog!
    fileprivate var mContactLoadDialog2: ContactLoadDialog2!
    fileprivate var mContactUpdateSelectDialog: ContactUpdateSelectDialog!
    fileprivate var mContactDeleteDialog: ContactDeleteDialog!
    fileprivate var mContactImportCSVDialog: ContactImportCSVDialog!
    fileprivate var mGuide1Dialog: Guide1Dialog!
    fileprivate var mGuide2SelectDialog: Guide2SelectDialog!
    fileprivate var mGuide3Dialog: Guide3Dialog!
    fileprivate var mGuide4SelectDialog: Guide4SelectDialog!
    fileprivate var mGuide5Dialog: Guide5Dialog!
    fileprivate var mGuide6Dialog: Guide6Dialog!
    //結果表示用クラス保持用
    internal var mEarthResultDialog: EarthResultDialog!
    
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
        //説明１
        btnGuide1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide1.layer.masksToBounds = true
        btnGuide1.setTitle("基礎データ入力ボタン", for: UIControl.State())
        btnGuide1.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide1.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnGuide1.translatesAutoresizingMaskIntoConstraints = false
        btnGuide1.addTarget(self, action: #selector(self.showGuide1(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide1)
        //説明２
        btnGuide2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide2.layer.masksToBounds = true
        btnGuide2.setTitle("連絡網データ操作", for: UIControl.State())
        btnGuide2.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide2.translatesAutoresizingMaskIntoConstraints = false
        btnGuide2.addTarget(self, action: #selector(self.showGuide2(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide2)
        //説明３
        btnGuide3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide3.layer.masksToBounds = true
        btnGuide3.setTitle("各事象操作画面切り替えボタン", for: UIControl.State())
        btnGuide3.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnGuide3.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide3.translatesAutoresizingMaskIntoConstraints = false
        btnGuide3.addTarget(self, action: #selector(self.showGuide3(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide3)
        //説明４
        btnGuide4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide4.layer.masksToBounds = true
        btnGuide4.setTitle("非常招集確認ボタン", for: UIControl.State())
        btnGuide4.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide4.translatesAutoresizingMaskIntoConstraints = false
        btnGuide4.addTarget(self, action: #selector(self.showGuide4(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide4)
        //説明５
        btnGuide5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide5.layer.masksToBounds = true
        btnGuide5.setTitle("情報確認ボタン", for: UIControl.State())
        btnGuide5.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide5.translatesAutoresizingMaskIntoConstraints = false
        btnGuide5.addTarget(self, action: #selector(self.showGuide5(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide5)
        //説明６
        btnGuide6.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide6.layer.masksToBounds = true
        btnGuide6.setTitle("連絡網ボタン", for: UIControl.State())
        btnGuide6.setTitleColor(UIColor.black, for: UIControl.State())
        btnGuide6.translatesAutoresizingMaskIntoConstraints = false
        btnGuide6.addTarget(self, action: #selector(self.showGuide6(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide6)

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
        mGuide1Dialog = Guide1Dialog(parentView: self)
        mGuide2SelectDialog = Guide2SelectDialog(parentView: self)
        mGuide3Dialog = Guide3Dialog(parentView: self)
        mGuide4SelectDialog = Guide4SelectDialog(parentView: self)
        mGuide5Dialog = Guide5Dialog(parentView: self)
        mGuide6Dialog = Guide6Dialog(parentView: self)
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
            Constraint(lblGuide, .bottom, to:padY2, .top, constant:8),
            Constraint(lblGuide, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblGuide, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .bottom, to:btnGuide1, .top, constant:0),
            Constraint(padY2, .leading, to:self.view, .leading, constant:0),
            Constraint(padY2, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明１ボタン
            Constraint(btnGuide1, .bottom, to:padY3, .top, constant:0),
            Constraint(btnGuide1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide1, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .bottom, to:btnGuide2, .top, constant:0),
            Constraint(padY3, .leading, to:self.view, .leading, constant:0),
            Constraint(padY3, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明２ボタン
            Constraint(btnGuide2, .bottom, to:padY4, .top, constant:0),
            Constraint(btnGuide2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide2, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .bottom, to:btnGuide3, .top, constant:0),
            Constraint(padY4, .leading, to:self.view, .leading, constant:0),
            Constraint(padY4, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明３ボタン Y座標の中心
            Constraint(btnGuide3, .centerY, to:self.view, .centerY, constant:0),
            Constraint(btnGuide3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide3, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .top, to:btnGuide3, .bottom, constant:0),
            Constraint(padY5, .leading, to:self.view, .leading, constant:0),
            Constraint(padY5, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明４ボタン
            Constraint(btnGuide4, .top, to:padY5, .bottom, constant:0),
            Constraint(btnGuide4, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide4, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .top, to:btnGuide4, .bottom, constant:0),
            Constraint(padY6, .leading, to:self.view, .leading, constant:0),
            Constraint(padY6, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明５ボタン
            Constraint(btnGuide5, .top, to:padY6, .bottom, constant:0),
            Constraint(btnGuide5, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide5, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //説明６ボタン
            Constraint(btnGuide6, .top, to:btnGuide5, .bottom, constant:16),
            Constraint(btnGuide6, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide6, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
    }
    
    //参集アプリの使用目的
    @objc func showPurpose(_ sender: UIButton){
        mInfoDialog.showInfo("purpose")
    }
    
    //説明１
    @objc func showGuide1(_ sender: UIButton){
        mGuide1Dialog.showInfo()
    }
    
    //説明２
    @objc func showGuide2(_ sender: UIButton){
        mGuide2SelectDialog.showInfo()
    }
    
    //説明３
    @objc func showGuide3(_ sender: UIButton){
        mGuide3Dialog.showInfo()
    }
    
    //説明４
    @objc func showGuide4(_ sender: UIButton){
        mGuide4SelectDialog.showInfo()
    }
    
    //説明５
    @objc func showGuide5(_ sender: UIButton){
        mGuide5Dialog.showInfo()
    }
    
    //説明６
    @objc func showGuide6(_ sender: UIButton){
        mGuide6Dialog.showInfo()
    }
    
    //情報(地震)
    func showInfoEarthquake(_ sender: UIButton){
        mInfoDialog.showInfo("earthquake")
    }
    
    //情報（停電）
    func showInfoBlackout(_ sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }
    
    //情報（道路）
    func showInfoRoad(_ sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //連絡網
    func showContactLoad(_ sender: UIButton){
        let data:ContactSearchViewController = ContactSearchViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    //留意事項
    func showInfoCaution(_ sender: UIButton){
        mInfoDialog.showInfo("caution")
    }
    
    //防災ネット
    func showInfoBousainet(_ sender: UIButton){
        mBousainetDialog.showInfo()
    }
    
    //基礎データ入力画面遷移
    func onClickbtnData(_ sender : UIButton){
        //基礎データ入力画面に戻る
        mScreen = 1
        mViewController2.updateView()
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
