// 2018-09-26 作成

//
//  KinentaiNankaitraf1.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/01/18.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class KinentaiToukai1 : UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    //ボタン押したら出るUIWindow
    fileprivate var parent: KinentaiViewController!
    fileprivate var win1: UIWindow!
    fileprivate var text1: UITextView!
    fileprivate var textField1: UITextField!
    fileprivate var pic1: UIPickerView!
    let pic1Array: NSArray = ["静岡県中部","静岡県西部","駿河湾","遠州灘","その他"]
    fileprivate var label2: UILabel!
    /* fileprivate var text2: UITextView!
    fileprivate var textField2: UITextField!
    fileprivate var pic2: UIPickerView!
    let pic2Array: NSArray = ["山梨県","長野県","岐阜県","静岡県","愛知県","三重県","その他"]
    fileprivate var text3: UITextView!
    fileprivate var textField3: UITextField!
    fileprivate var pic3: UIPickerView!
    let pic3Array: NSArray = ["兵庫県","奈良県","和歌山県","その他"]
    fileprivate var text4: UITextView!
    fileprivate var textField4: UITextField!
    fileprivate var pic4: UIPickerView!
    let pic4Array: NSArray = ["徳島県","香川県","愛媛県","高知県","大分県","宮崎県","その他"] */
    fileprivate var btnClose: UIButton!
    fileprivate var btnAction: UIButton!
    fileprivate var mKinentaiResultDialog: KinentaiResultDialog!
    //fileprivate var mKinentaiSelectDialog: KinentaiSelectDialog!  //2018-09-26 追加-> 2019-02-03 削除
    fileprivate var mKinentaiSelectDialog3: KinentaiSelectDialog3!  //2019-02-02 追加
    
    // 2018-09-26 追加
    class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "ic_check_box.png")! as UIImage
        let uncheckedImage = UIImage(named: "ic_check_box_outline_blank.png")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControl.State.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
        
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    }
    fileprivate var chk1: CheckBox!
    fileprivate var chk2: CheckBox!
    fileprivate var chk3: CheckBox!
    fileprivate var chk4: CheckBox!
    fileprivate var chk5: CheckBox!
    fileprivate var chk6: CheckBox!
    fileprivate var chk7: CheckBox!
    fileprivate var chk8: CheckBox!
    
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
        textField1  = UITextField()
        pic1        = UIPickerView()
        label2      = UILabel()
        /* text2       = UITextView()
        textField2  = UITextField()
        pic2        = UIPickerView()
        text3       = UITextView()
        textField3  = UITextField()
        pic3        = UIPickerView()
        text4       = UITextView()
        textField4  = UITextField()
        pic4        = UIPickerView() */
        btnClose    = UIButton()
        btnAction   = UIButton()
        
        // 2018-09-26 追加
        chk1 = CheckBox()
        chk2 = CheckBox()
        chk3 = CheckBox()
        chk4 = CheckBox()
        chk5 = CheckBox()
        chk6 = CheckBox()
        chk7 = CheckBox()
        chk8 = CheckBox()
        
    }
    
    //デコンストラクタ
    deinit{
        parent      = nil
        win1        = nil
        
        text1       = nil
        textField1  = nil
        pic1        = nil
        
        label2      = nil
        
        /* text2       = nil
        textField2  = nil
        pic2        = nil
        
        text3       = nil
        textField3  = nil
        pic3        = nil
        
        text4       = nil
        textField4  = nil
        pic4        = nil */
        
        btnClose    = nil
        btnAction   = nil
        
        // 2018-09-26 追加
        chk1 = nil
        chk2 = nil
        chk3 = nil
        chk4 = nil
        chk5 = nil
        chk6 = nil
        chk7 = nil
        chk8 = nil

    }
    
    //表示
    func showResult(){
        //元の画面を暗く
        parent.view.alpha = 0.3
        mViewController.view.alpha = 0.3
        //初期設定
        //Win1
        win1.backgroundColor = UIColor.white
        win1.frame = CGRect(x: 80,y: 10,width: parent.view.frame.width-40,height: parent.view.frame.height*1.2) //東海は情報量が多く、parentが画面*0.8を引き継いでいるので逆に拡大させる必要あり。よって*1.2にしている
        win1.layer.position = CGPoint(x: parent.view.frame.width/2, y: parent.view.frame.height/2+72) //+72調整
        win1.alpha = 1.0
        win1.layer.cornerRadius = 10
        //KeyWindowにする
        win1.makeKey()
        //表示
        self.win1.makeKeyAndVisible()
        
        //１セット目
        //text1生成
        text1.frame = CGRect(x: 10,y: 10, width: self.win1.frame.width - 20, height: self.win1.frame.height)
        text1.backgroundColor = UIColor.clear
        text1.font = UIFont.systemFont(ofSize: CGFloat(14))
        text1.textColor = UIColor.black
        text1.textAlignment = NSTextAlignment.left
        text1.isEditable = false
        text1.isScrollEnabled = true
        text1.dataDetectorTypes = .link
        text1.text = "東海地震アクションプラン\n\n次の①②を満たした場合に適用（ただし、南海トラフアクションプラン適用となる場合を除く）\n\n①震央地名が次のいずれかに該当"
        self.win1.addSubview(text1)
        //textField1
        textField1.frame = CGRect(x: 10,y: 120, width: self.win1.frame.width - 20, height: 60)
        textField1.backgroundColor = UIColor.clear
        textField1.font = UIFont.systemFont(ofSize: (CGFloat(18)))
        textField1.textAlignment = NSTextAlignment.center
        textField1.text = pic1Array[0] as? String
        textField1.inputView = pic1 //ここでpickerView1と紐付け
        //pickerViewとともにポップアップするツールバーとボタンの設定
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        let doneItem = UIBarButtonItem(title:"選択", style: UIBarButtonItem.Style.plain, target: self, action: #selector(KinentaiToukai1.done))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil) //小ワザ。上の選択ボタンを右寄せにするためのダミースペース
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        textField1.inputAccessoryView = toolbar
        self.win1.addSubview(textField1)
        //pic1
        pic1.delegate = self
        pic1.dataSource = self
        pic1.translatesAutoresizingMaskIntoConstraints = false
        pic1.tag = 1
        pic1.selectRow(0, inComponent:0, animated:false) //呼び出したrow値でピッカー初期化
        
        //label2生成
        label2.text = "②次の都県のうち、2県以上で、震度6強(政令指定都市については震度6弱)以上が観測された場合、又は大津波警報が発表された場合\n\n【強化地域8都県】"
        label2.frame = CGRect(x: 10,y: 170, width: self.win1.frame.width - 20, height: 120)
        label2.backgroundColor = UIColor.clear
        label2.font = UIFont.systemFont(ofSize: (CGFloat(14)))
        label2.textColor = UIColor.black
        label2.textAlignment = NSTextAlignment.left
        label2.numberOfLines = 5
        self.win1.addSubview(label2)
        
        // checkbox生成　2018-09-26 追加
        chk1.frame = CGRect(x:0, y:self.win1.frame.height/2*1.05, width:self.win1.frame.width/2, height:40)
        chk1.setTitle("静岡県", for: UIControl.State())
        chk1.setTitleColor(UIColor.black, for: UIControl.State())
        chk1.awakeFromNib()
        self.win1.addSubview(chk1)
        
        chk2.frame = CGRect(x:self.win1.frame.width/2, y:self.win1.frame.height/2*1.05, width:self.win1.frame.width/2, height:40)
        chk2.setTitle("愛知県", for: UIControl.State())
        chk2.setTitleColor(UIColor.black, for: UIControl.State())
        chk2.awakeFromNib()
        self.win1.addSubview(chk2)
        
        chk3.frame = CGRect(x:0, y:self.win1.frame.height/2*1.2, width:self.win1.frame.width/2, height:40)
        chk3.setTitle("山梨県", for: UIControl.State())
        chk3.setTitleColor(UIColor.black, for: UIControl.State())
        chk3.awakeFromNib()
        self.win1.addSubview(chk3)
        
        chk4.frame = CGRect(x:self.win1.frame.width/2, y:self.win1.frame.height/2*1.2, width:self.win1.frame.width/2, height:40)
        chk4.setTitle("長野県", for: UIControl.State())
        chk4.setTitleColor(UIColor.black, for: UIControl.State())
        chk4.awakeFromNib()
        self.win1.addSubview(chk4)
        
        chk5.frame = CGRect(x:0, y:self.win1.frame.height/2*1.35, width:self.win1.frame.width/2, height:40)
        chk5.setTitle("神奈川県", for: UIControl.State())
        chk5.setTitleColor(UIColor.black, for: UIControl.State())
        chk5.awakeFromNib()
        self.win1.addSubview(chk5)
        
        chk6.frame = CGRect(x:self.win1.frame.width/2, y:self.win1.frame.height/2*1.35, width:self.win1.frame.width/2, height:40)
        chk6.setTitle("三重県", for: UIControl.State())
        chk6.setTitleColor(UIColor.black, for: UIControl.State())
        chk6.awakeFromNib()
        self.win1.addSubview(chk6)
        
        chk7.frame = CGRect(x:0, y:self.win1.frame.height/2*1.5, width:self.win1.frame.width/2, height:40)
        chk7.setTitle("岐阜県", for: UIControl.State())
        chk7.setTitleColor(UIColor.black, for: UIControl.State())
        chk7.awakeFromNib()
        self.win1.addSubview(chk7)
        
        chk8.frame = CGRect(x:self.win1.frame.width/2, y:self.win1.frame.height/2*1.5, width:self.win1.frame.width/2, height:40)
        chk8.setTitle("東京都", for: UIControl.State())
        chk8.setTitleColor(UIColor.black, for: UIControl.State())
        chk8.awakeFromNib()
        self.win1.addSubview(chk8)
        
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
        btnAction.setTitle("判定", for: UIControl.State())
        btnAction.setTitleColor(UIColor.white, for: UIControl.State())
        btnAction.layer.masksToBounds = true
        btnAction.layer.cornerRadius = 10.0
        btnAction.layer.position = CGPoint(x: self.win1.frame.width/2+60, y: self.win1.frame.height-20)
        btnAction.addTarget(self, action: #selector(self.onClickAction(_:)), for: .touchUpInside)
        self.win1.addSubview(btnAction)
    }
    
    //表示例数
    func numberOfComponents(in pickerView: UIPickerView)-> Int{
        return 1
    }
    
    //表示行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        //返す行数
        var rowNum: Int = 0
        switch pickerView.tag {
        case 1:
            rowNum = pic1Array.count
            break
        /* case 2:
            rowNum = pic2Array.count
            break
        case 3:
            rowNum = pic3Array.count
            break
        case 4:
            rowNum = pic4Array.count
            break */
        default:
            rowNum = pic1Array.count
            break
        }
        
        return rowNum
    }
    
    //表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        //返す列
        var picComponent: String?
        switch pickerView.tag {
        case 1:
            picComponent = pic1Array[row] as? String
            break
        /* case 2:
            picComponent = pic2Array[row] as? String
            break
        case 3:
            picComponent = pic3Array[row] as? String
            break
        case 4:
            picComponent = pic4Array[row] as? String
            break */
        default:
            picComponent = pic1Array[row] as? String
            break
        }
        
        return picComponent
    }
    
    //選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component:Int) {
        print("列:\(row)")
        switch pickerView.tag {
        case 1:
            textField1.text = pic1Array[row] as? String
            break
        /* case 2:
            textField2.text = pic2Array[row] as? String
            break
        case 3:
            textField3.text = pic3Array[row] as? String
            break
        case 4:
            textField4.text = pic4Array[row] as? String
            break */
        default:
            break
        }
    }
    
    //ツールバーの選択ボタンを押した時
    @objc func done() {
        textField1.endEditing(true) //これで閉じる
        /* textField2.endEditing(true)
        textField3.endEditing(true)
        textField4.endEditing(true) */
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
        mViewController.view.alpha = 1.0
        //対応の結果であるアクションプランを表示
        var i: Int8 = 0
        if chk1.isChecked {i += 1}
        if chk2.isChecked {i += 1}
        if chk3.isChecked {i += 1}
        if chk4.isChecked {i += 1}
        if chk5.isChecked {i += 1}
        if chk6.isChecked {i += 1}
        if chk7.isChecked {i += 1}
        if chk8.isChecked {i += 1}
        if (textField1.text != "その他" && i >= 2 ) {
            //2019-02-03 追加
            /*mKinentaiSelectDialog = KinentaiSelectDialog(index: 31, parentView: parent)
            mKinentaiSelectDialog.showInfo()*/
            mKinentaiSelectDialog3 = KinentaiSelectDialog3(index: 1, parentView: parent)
            mKinentaiSelectDialog3.showInfo()
        } else {
            mKinentaiResultDialog = KinentaiResultDialog(parentView: parent)
            mKinentaiResultDialog.showResult(35, item: 0)
        }
    }
}
