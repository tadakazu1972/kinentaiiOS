//
//  TyphoonViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2016/12/01.
//  Copyright © 2016年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class TyphoonViewController: UIViewController {
    //メイン画面
    let lblTyphoon      = UILabel(frame: CGRect.zero)
    let btnTyphoon1     = UIButton(frame: CGRect.zero)
    let btnTyphoon2     = UIButton(frame: CGRect.zero)
    let btnTyphoon3     = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let btnTyphoonWeather = UIButton(frame: CGRect.zero)
    let btnTyphoonRiver   = UIButton(frame: CGRect.zero)
    let btnTyphoonRoad       = UIButton(frame: CGRect.zero)
    let btnTyphoonTel        = UIButton(frame: CGRect.zero)
    let btnTyphoonCaution    = UIButton(frame: CGRect.zero)
    let btnTyphoonBousaiNet  = UIButton(frame: CGRect.zero)
    let pad21            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRect.zero)
    let pad23            = UIView(frame: CGRect.zero)
    let pad31            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRect.zero)
    let pad33            = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mBousainetDialog: BousainetDialog!
    fileprivate var mTyphoonSelectDialog: TyphoonSelectDialog!
    fileprivate var mPassInputDialog: PassInputDialog!
    //結果表示用クラス保持用
    internal var mTyphoonResultDialog: TyphoonResultDialog!
    //データ保存用
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.2, green:0.2, blue:0.9, alpha:1.0)
        //Button生成
        //非常召集基準（風水害）
        lblTyphoon.text = "非常招集基準（風水害）"
        lblTyphoon.textColor = UIColor.white
        lblTyphoon.textAlignment = NSTextAlignment.center
        lblTyphoon.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTyphoon)
        //非常警備の基準（全て）
        btnTyphoon1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon1.layer.masksToBounds = true
        btnTyphoon1.setTitle("非常警備の基準(全て)", for: UIControl.State())
        btnTyphoon1.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoon1.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoon1.tag=5
        btnTyphoon1.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon1.addTarget(self, action: #selector(self.showSelectTyphoon1(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoon1)
        //気象警報による非常招集
        btnTyphoon2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon2.layer.masksToBounds = true
        btnTyphoon2.setTitle("気象警報による非常招集", for: UIControl.State())
        btnTyphoon2.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoon2.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoon2.tag=6
        btnTyphoon2.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon2.addTarget(self, action: #selector(self.showSelectTyphoon2(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoon2)
        //河川水位による非常招集
        btnTyphoon3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoon3.layer.masksToBounds = true
        btnTyphoon3.setTitle("河川水位等による非常招集", for: UIControl.State())
        btnTyphoon3.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoon3.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoon3.tag=7
        btnTyphoon3.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoon3.addTarget(self, action: #selector(self.showSelectTyphoon3(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoon3)
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
        //情報（気象）
        btnTyphoonWeather.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonWeather.layer.masksToBounds = true
        btnTyphoonWeather.setTitle("情報(気象)", for: UIControl.State())
        btnTyphoonWeather.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonWeather.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoonWeather.tag=9
        btnTyphoonWeather.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonWeather.addTarget(self, action: #selector(self.showInfoWeather(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonWeather)
        //情報（河川）
        btnTyphoonRiver.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRiver.layer.masksToBounds = true
        btnTyphoonRiver.setTitle("情報(河川)", for: UIControl.State())
        btnTyphoonRiver.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonRiver.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoonRiver.tag=10
        btnTyphoonRiver.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRiver.addTarget(self, action: #selector(self.showInfoRiver(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonRiver)
        //情報（道路）
        btnTyphoonRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonRoad.layer.masksToBounds = true
        btnTyphoonRoad.setTitle("情報(道路)", for: UIControl.State())
        btnTyphoonRoad.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonRoad.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoonRoad.tag=11
        btnTyphoonRoad.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonRoad)
        //連絡網
        btnTyphoonTel.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonTel.layer.masksToBounds = true
        btnTyphoonTel.setTitle("連絡網", for: UIControl.State())
        btnTyphoonTel.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonTel.tag=12
        btnTyphoonTel.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonTel.addTarget(self, action: #selector(self.showContactLoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonTel)
        //留意事項
        btnTyphoonCaution.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonCaution.layer.masksToBounds = true
        btnTyphoonCaution.setTitle("留意事項", for: UIControl.State())
        btnTyphoonCaution.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonCaution.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        btnTyphoonCaution.tag=13
        btnTyphoonCaution.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonCaution.addTarget(self, action: #selector(self.showInfoCaution(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonCaution)
        //防災ネット
        btnTyphoonBousaiNet.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnTyphoonBousaiNet.layer.masksToBounds = true
        btnTyphoonBousaiNet.setTitle("防災ネット", for: UIControl.State())
        btnTyphoonBousaiNet.setTitleColor(UIColor.black, for: UIControl.State())
        btnTyphoonBousaiNet.tag=14
        btnTyphoonBousaiNet.translatesAutoresizingMaskIntoConstraints = false
        btnTyphoonBousaiNet.addTarget(self, action: #selector(self.showInfoBousainet(_:)), for: .touchUpInside)
        self.view.addSubview(btnTyphoonBousaiNet)
        //pad
        pad21.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad21)
        pad22.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad22)
        pad23.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad23)
        //pad
        pad31.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad31)
        pad32.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad32)
        pad33.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad33)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mBousainetDialog = BousainetDialog(parentView: self)
        mTyphoonResultDialog = TyphoonResultDialog(parentView: self) //このViewControllerを渡してあげる
        mPassInputDialog = PassInputDialog(parentView: self)
        
        //passCheckをfalseで初期化
        userDefaults.set(false, forKey: "passCheck")
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
            //非常召集基準（風水害）ラベル
            Constraint(lblTyphoon, .bottom, to:padY2, .top, constant:0),
            Constraint(lblTyphoon, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblTyphoon, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .bottom, to:btnTyphoon1, .top, constant:0),
            Constraint(padY2, .leading, to:self.view, .leading, constant:0),
            Constraint(padY2, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //非常警備の基準(全て)ボタン
            Constraint(btnTyphoon1, .bottom, to:padY3, .top, constant:0),
            Constraint(btnTyphoon1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon1, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .bottom, to:btnTyphoon2, .top, constant:0),
            Constraint(padY3, .leading, to:self.view, .leading, constant:0),
            Constraint(padY3, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //気象警報による非常招集ボタン Y座標の中心 -72に留意
            Constraint(btnTyphoon2, .centerY, to:self.view, .centerY, constant:-72),
            Constraint(btnTyphoon2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon2, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .top, to:btnTyphoon2, .bottom, constant:0),
            Constraint(padY4, .leading, to:self.view, .leading, constant:0),
            Constraint(padY4, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //河川水位による非常招集ボタン
            Constraint(btnTyphoon3, .top, to:padY4, .bottom, constant:0),
            Constraint(btnTyphoon3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnTyphoon3, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .top, to:btnTyphoon3, .bottom, constant:0),
            Constraint(padY5, .leading, to:self.view, .leading, constant:0),
            Constraint(padY5, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad21, .leading, to:self.view, .leading, constant:0),
            Constraint(pad21, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(気象)ボタン
            Constraint(btnTyphoonWeather, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(btnTyphoonWeather, .leading, to:pad21, .trailing, constant:0),
            Constraint(btnTyphoonWeather, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad22, .leading, to:btnTyphoonWeather, .trailing, constant:0),
            Constraint(pad22, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(河川)ボタン
            Constraint(btnTyphoonRiver, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(btnTyphoonRiver, .leading, to:pad22, .trailing, constant:0),
            Constraint(btnTyphoonRiver, .width, to:btnTyphoonWeather, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .bottom, to:btnTyphoonTel, .top, constant:-8),
            Constraint(pad23, .leading, to:btnTyphoonRiver, .trailing, constant:0),
            Constraint(pad23, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnTyphoonRoad, .bottom, to:btnTyphoonTel, .top ,constant:-8),
            Constraint(btnTyphoonRoad, .leading, to:pad23, .trailing, constant:0),
            Constraint(btnTyphoonRoad, .width, to:btnTyphoonWeather, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .top, to:btnTyphoonWeather, .bottom, constant:8),
            Constraint(pad31, .leading, to:self.view, .leading, constant:0),
            Constraint(pad31, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //連絡網ボタン
            Constraint(btnTyphoonTel, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnTyphoonTel, .leading, to:pad31, .trailing, constant:0),
            Constraint(btnTyphoonTel, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad32, .leading, to:btnTyphoonTel, .trailing, constant:0),
            Constraint(pad32, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //留意事項ボタン
            Constraint(btnTyphoonCaution, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnTyphoonCaution, .leading, to:pad32, .trailing, constant:0),
            Constraint(btnTyphoonCaution, .width, to:btnTyphoonTel, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad33, .leading, to:btnTyphoonCaution, .trailing, constant:0),
            Constraint(pad33, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //防災ネットボタン
            Constraint(btnTyphoonBousaiNet, .bottom, to:self.view, .bottom ,constant:-8),
            Constraint(btnTyphoonBousaiNet, .leading, to:pad33, .trailing, constant:0),
            Constraint(btnTyphoonBousaiNet, .width, to:btnTyphoonTel, .width, constant:0)
            ])
    }
    
    //非常警備の基準(全て)
    @objc func showSelectTyphoon1(_ sender: UIButton){
        mTyphoonResultDialog.showResult(11)
    }
    
    //気象警報による非常招集
    @objc func showSelectTyphoon2(_ sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 2, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //河川水位による非常招集
    @objc func showSelectTyphoon3(_ sender: UIButton){
        mTyphoonSelectDialog = TyphoonSelectDialog(index: 3, parentView: self)
        mTyphoonSelectDialog.showInfo()
    }
    
    //情報(気象)
    @objc func showInfoWeather(_ sender: UIButton){
        mInfoDialog.showInfo("weather")
    }
    
    //情報（河川）
    @objc func showInfoRiver(_ sender: UIButton){
        mInfoDialog.showInfo("river")
    }
    
    //情報（道路）
    @objc func showInfoRoad(_ sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //連絡網
    @objc func showContactLoad(_ sender: UIButton){
        //初期設定のままだと設定画面に遷移
        if userDefaults.string(forKey: "password") == "nil" {
            //PasViewController呼び出し
            let data:PassViewController = PassViewController()
            let nav = UINavigationController(rootViewController: data)
            nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
            self.present(nav, animated: true, completion: nil)
        } else if !userDefaults.bool(forKey: "passCheck"){
            //パスワードチェック呼び出し
            mPassInputDialog.showResult()
        } else {
            //合っていれば表示
            let data:ContactSearchViewController = ContactSearchViewController()
            let nav = UINavigationController(rootViewController: data)
            nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
            self.present(nav, animated: true, completion: nil)
        }
    }

    //留意事項
    @objc func showInfoCaution(_ sender: UIButton){
        mInfoDialog.showInfo("typhoon_caution")
    }
    
    //防災ネット
    @objc func showInfoBousainet(_ sender: UIButton){
        mBousainetDialog.showInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
