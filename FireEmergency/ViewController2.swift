//
//  ViewController2.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2020/04/26.
//  Copyright © 2020年 tadakazu nakamichi. All rights reserved.
//

import UIKit

//グローバル変数
//internal var mViewController2: ViewController2!
//基礎データ入力ボタンからの画面切り替え判定変数　1:基礎データ入力　2:連絡網データ操作 3:アプリ説明書　4:非常参集職員情報登録
internal var mScreen: Int!

class ViewController2: UIViewController {
    //別クラスのインスタンス保持用変数
    
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mBousainetDialog: BousainetDialog!
        
    private lazy var mGuideViewController: GuideViewController = {
        var viewController = GuideViewController()
        add(asChildViewController: viewController)
        return viewController
    }()
    
    //スタート
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //明るく
        self.view.alpha = 1.0
        
        //常にViewController2のインスタンス作成時には基礎データ入力画面になるように1をセット
        mScreen = 1
        
        //自分を保存：後でダイアログ表示の際に暗くするときの呼び出しに使うため
        mViewController2 = self
                                
        //子ViewControllerセット
        setupView()
        
        //ViewControllerを暗く
        mViewController.view.alpha = 0.1
    }
        
    private func setupView(){
        updateView()
    }
    
    internal func updateView(){
        switch mScreen {
            
        //アプリ説明書
        case 3:
            add(asChildViewController: mGuideViewController)
        
        default:
            break
        }
    }
    
    //子ViewController 追加、削除
    private func add(asChildViewController viewController: UIViewController){
        addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.view.frame = self.view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //子ViewControllerへ通知
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        //子ViewControllerへ通知
        viewController.willMove(toParent: nil)
        //子ViewをSuperviewから削除
        viewController.view.removeFromSuperview()
        //子ViewControllerへ通知
        viewController.removeFromParent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

