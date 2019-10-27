//
//  ItemViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/12.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class ItemViewController: TextFieldViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemTimeLabel: UILabel!
    @IBOutlet weak var storeNameInItemLabel: UILabel!
    @IBOutlet weak var whySaleTitleLabel: UILabel!
    @IBOutlet weak var whySaleTextLabel: UILabel!
    @IBOutlet weak var allergiesTagTitleView: UIView!
    @IBOutlet weak var allergiesTagTitleLabel: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeTimeLabel: UILabel!
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var parkingLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var googleMap: GMSMapView!
    
    @IBOutlet weak var halfModalView: UIView!
    @IBOutlet weak var handleImage: UIImageView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var receiveTimeTextField: UITextField!
    @IBOutlet weak var halfModalViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet var panGestureRecognizerOnHalfModalView: UIPanGestureRecognizer!
    @IBOutlet var halfModalViewsParts: [UIView]!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var payButtonTitleLabel: UILabel!
    @IBOutlet weak var backgroundOfPayButtonViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var imagesNeedPlaceHolder: [UIImageView]!
    @IBOutlet var labelsNeedPlaceHolder: [UILabel]!
    
    @IBOutlet weak var lowerViewTopConstraint: NSLayoutConstraint!
    let openLowerViewTopConstraint: CGFloat = 0
    let closeLowerViewTopConstraint: CGFloat = -130
    var isWhySaleTextOpen = true
    
    @IBOutlet weak var lowerViewHeight: NSLayoutConstraint!
    
    let foodDetailModel = FoodDetailModel()
    let animation = Animation()
    
    var isHalfModalViewOpen = false
    var halfModalViewClosingHeight: CGFloat = 110.0
    var halfModalViewOpeningHeight: CGFloat = 260.0
    var defaultBackgroundOfPayButtonViewHeight: CGFloat!
    
    var amountPickerData: [[String]] = [[], []]
    var receivePickerData: [[String]] = [[], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "商品購入"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        
        animationWhySaleText(animated: false) // 最初は閉じる
        
        imagesNeedPlaceHolder.appearImagePlaceHolders()
        labelsNeedPlaceHolder.appearLabelPlaceHolders()
        
        foodDetailModel.delegate = self
        
        foodDetailModel.getFoodDetail(foodId: 1) // 暫定の決めうち
        
        // ハーフモーダルビュー
        halfModalViewHeightConstraint.constant = halfModalViewClosingHeight
        handleImage.image = UIImage(named: "neutralHandleOnHalf-ModalView")
        fadeView.backgroundColor = UIColor.white
        fadeView.alpha = 1
        defaultBackgroundOfPayButtonViewHeight = backgroundOfPayButtonViewHeightConstraint.constant
        
        // TextField
        setUpNotificationForTextField()
        self.amountTextField.delegate = self
        self.receiveTimeTextField.delegate = self
        viewWithTextField = halfModalView
        
        let amountPickerView = UIPickerView()
        let receiveTimePickerView = UIPickerView()
        amountPickerView.tag = PickerSource.amount.rawValue
        amountPickerView.delegate = self
        amountPickerView.dataSource = self
        receiveTimePickerView.tag = PickerSource.receiveTime.rawValue
        receiveTimePickerView.delegate = self
        receiveTimePickerView.dataSource = self
        amountPickerView.showsSelectionIndicator = true
        receiveTimePickerView.showsSelectionIndicator = true
        let amountTextFieldToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 45))
        let receiveTimeTextFieldToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 45))
        let rightArrorItem = UIBarButtonItem(image: UIImage(named: "RightArrow")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapRightArrow))
        let leftArrorItem = UIBarButtonItem(image: UIImage(named: "LeftArrow")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapLeftArrow))
        let flexibleSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let fixedSpaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        fixedSpaceItem.width = 40
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let done2Item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done2))
        amountTextFieldToolBar.setItems([fixedSpaceItem, rightArrorItem, flexibleSpaceItem, doneItem], animated: true)
        receiveTimeTextFieldToolBar.setItems([leftArrorItem, flexibleSpaceItem, done2Item], animated: true)
        amountTextField.inputView = amountPickerView
        receiveTimeTextField.inputView = receiveTimePickerView
        amountTextField.inputAccessoryView = amountTextFieldToolBar
        receiveTimeTextField.inputAccessoryView  = receiveTimeTextFieldToolBar
        
        amountPickerData = [["1", "2", "3", "4", "5"], [""]]
        
        for hour in 0 ..< 24 {
            receivePickerData[0].append(String(hour))
        }
        for minutes in 0 ..< 60 {
            receivePickerData[1].append(String(minutes))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TextField
        //self.setUpNotificationForTextField()
    }
    
    @IBAction func whySaleTitleTap(_ sender: UITapGestureRecognizer) {
        animationWhySaleText(animated: true)
    }
    
    @objc func login() {
        
    }
    
    func animationWhySaleText(animated: Bool) {
        whySaleTitleLabel.text = isWhySaleTextOpen ? "[+] 出品経緯" : "[-] 出品経緯"
        lowerViewTopConstraint.constant = isWhySaleTextOpen ? closeLowerViewTopConstraint : openLowerViewTopConstraint
        isWhySaleTextOpen.toggle()
        if animated == true {
            UIView.animate(withDuration: 0.4, animations: { [weak self] in
                self?.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func panHalfModalView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let deviation: CGPoint = sender.translation(in: view)
            let movedConstraint = halfModalViewHeightConstraint.constant - deviation.y
            if halfModalViewClosingHeight <= movedConstraint && movedConstraint <= halfModalViewOpeningHeight {
                halfModalViewHeightConstraint.constant = movedConstraint
            }
            fadeView.alpha = 1 - ((movedConstraint - halfModalViewClosingHeight) / (halfModalViewOpeningHeight - halfModalViewClosingHeight))
            sender.setTranslation(CGPoint(x: deviation.x, y: 0), in: view)
        case .ended:
            let halfAreaHeight = (halfModalViewOpeningHeight + halfModalViewClosingHeight) / 2
            let velocity = sender.velocity(in: view)
            var isShouldBeClose = halfModalViewHeightConstraint.constant <= halfAreaHeight
            if isHalfModalViewOpen == true && 500.0 <= velocity.y {
                isShouldBeClose = true
            } else if isHalfModalViewOpen == false && -500.0 >= velocity.y {
                isShouldBeClose = false
            }
            animation.animateHalfModalView(
                imageView: handleImage,
                imageName: isShouldBeClose ? "neutralHandleOnHalf-ModalView" : "toCloseHandleOnHalf-ModalView",
                heightConstraint: halfModalViewHeightConstraint,
                height: isShouldBeClose ? halfModalViewClosingHeight : halfModalViewOpeningHeight,
                withDuration: 0.5,
                uiView: self.view,
                isDoTransparent: !isShouldBeClose,
                transparentUIView: fadeView,
                completion: {
                    self.backgroundOfPayButtonViewHeightConstraint.constant = self.defaultBackgroundOfPayButtonViewHeight
                }
            )
            isHalfModalViewOpen = !isShouldBeClose
            self.payButton.isEnabled = isShouldBeClose
            self.payButtonTitleLabel.text = isShouldBeClose ? "購入" : "購入確認"
            let backImage = isShouldBeClose ? UIImage(named: "ETASTEsFrame") : UIImage(named: "ETASTEsFrame")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            self.payButton.setImage(backImage, for: .normal)
            self.payButton.tintColor = UIColor.etasteGray
            backgroundOfPayButtonViewHeightConstraint.constant = isShouldBeClose ? 60 : defaultBackgroundOfPayButtonViewHeight
        default:
            break
        }
    }
    
    @IBAction func payButtonTap(_ sender: UIButton) {
        // 開く動きのみなので、後で関数にして共通化した方が良い
        animation.animateHalfModalView(
            imageView: handleImage,
            imageName: "toCloseHandleOnHalf-ModalView",
            heightConstraint: halfModalViewHeightConstraint,
            height: halfModalViewOpeningHeight,
            withDuration: 1,
            uiView: self.view,
            isDoTransparent: true,
            transparentUIView: fadeView,
            completion: {}
        )
        isHalfModalViewOpen = true
        self.payButton.isEnabled = false
        self.payButtonTitleLabel.text = "購入確認"
        let backImage = UIImage(named: "ETASTEsFrame")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.payButton.setImage(backImage, for: .normal)
        self.payButton.tintColor = UIColor.etasteGray
    }
    
}

extension ItemViewController: FoodDetailModelDelegate {
    func didRecieveFoodDetailData(foodDetailModel: FoodDetailModel, foodDetail: FoodDetail) {
        let foodInfo: FoodItem = foodDetail.foodInfo.first! // 仕様的に要素が1つしか無いはずなので先頭のみ取る
        let storeInfo: Store = foodDetail.storeInfo.first!
        
        itemImage.image = UIImage(url: foodInfo.image)
        itemNameLabel.text = foodInfo.name
        let stringOriginalPrice = String(foodInfo.originalPrice)
        let stringSalePrice = String(foodInfo.salePrice)
        let countOriginalPrice = stringOriginalPrice.count
        let countSalePrice = stringSalePrice.count
        let baseItemPriceText = " " + stringOriginalPrice + "円 → " + stringSalePrice + "円"
        let attributeItemPriceText = NSMutableAttributedString(string: baseItemPriceText)
        attributeItemPriceText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, countOriginalPrice))
        attributeItemPriceText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSMakeRange(countOriginalPrice + 4, countSalePrice))
        itemPriceLabel.attributedText = attributeItemPriceText
        itemTimeLabel.text = " 受取時間 " + foodInfo.startTime + "〜" + foodInfo.endTime
        storeNameInItemLabel.text = " " + storeInfo.name
        whySaleTitleLabel.text = "[+] 出品経緯 " // プレースホルダーを更新するため。後ろのスペースも必要
        whySaleTextLabel.text = foodInfo.whySale
        
        allergiesTagTitleLabel.text = "アレルギー表示"
        let allergys = foodInfo.allergys
        guard let allergies = allergys else {
            return
        }
        if allergies.count > 4 {
            lowerViewHeight.constant += 43
        }
        for (index, allergy) in allergies.enumerated() {
            let nib = UINib(nibName: "AllergiesTagView", bundle: nil)
            let tag = nib.instantiate(withOwner: nil, options: nil)[0] as! AllergiesTagView
            tag.allergiesTagLabel.text = allergy.name
            tag.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(tag)
            let steps: CGFloat = CGFloat((index / 4) + 1) // 段数。最初を１段とする
            if index % 4 == 0 {
                tag.leadingAnchor.constraint(equalTo: allergiesTagTitleView.leadingAnchor, constant: tag.frame.maxX / 2).isActive = true // なぜか幅が考慮されないので補足している。下も同じ
            } else {
                tag.leadingAnchor.constraint(equalTo: allergiesTagTitleView.leadingAnchor, constant: CGFloat(77 * (index % 4)) + tag.frame.maxX / 2).isActive = true
            }
            
            tag.topAnchor.constraint(equalTo: allergiesTagTitleView.bottomAnchor, constant: CGFloat(13 * steps) + tag.frame.maxY / 2 * steps).isActive = true
        }
        halfModalViewsParts.forEach { self.view.bringSubviewToFront($0) } // アレルギータグがaddSubview されて最前面にくるのでハーフモーダルビュー関連のUIを最前面に持ってくる
        
        storeImage.image = UIImage(url: storeInfo.image)
        storeNameLabel.text = storeInfo.name
        storeTimeLabel.text = storeInfo.openTime + "〜" + storeInfo.closeTime
        holidayLabel.text = storeInfo.holiday
        addressLabel.text = storeInfo.zip + "\n" + storeInfo.address
        telLabel.text = storeInfo.tel
        parkingLabel.text = storeInfo.parking
        let attributeURLText = NSMutableAttributedString(string: storeInfo.url)
        attributeURLText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, storeInfo.url.count))
        urlLabel.attributedText = attributeURLText
        let mapPosition = CLLocationCoordinate2D(latitude: Double(storeInfo.mapLatitude) as! CLLocationDegrees, longitude: Double(storeInfo.mapLongitude) as! CLLocationDegrees)
        let camera = GMSCameraPosition.camera(withTarget: mapPosition, zoom: 15)
        googleMap.camera = camera
        let marker = GMSMarker()
        marker.position = mapPosition
        marker.map = googleMap
    }
    
    func didRecieveFoodDetailError(foodDetailModel: FoodDetailModel, error: Error) {
        print("Error on getFood :", error)
    }
}

extension ItemViewController: UIPickerViewDataSource {
    enum PickerSource: Int, CaseIterable {
        case amount = 1
        case receiveTime = 2
        
        var row: Int {
            switch self {
            case .amount:
                return 1
            case .receiveTime:
                return 2
            }
        }
        
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PickerSource(rawValue: pickerView.tag)!.row
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch PickerSource(rawValue: pickerView.tag) {
        case .amount?:
            return amountPickerData[0].count
        case .receiveTime?:
            return receivePickerData[component].count
        case _:
            return 0
        }
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch PickerSource(rawValue: pickerView.tag) {
        case .amount?:
            return amountPickerData[0][row]
        case .receiveTime?:
            return receivePickerData[component][row]
        case _:
            return ""
        }
    }
    
    // 決定ボタン押下
    @objc func done() {
        amountTextField.endEditing(true)
        receiveTimeTextField.endEditing(true)
    }
    @objc func done2() {
        amountTextField.endEditing(true)
        receiveTimeTextField.endEditing(true)
    }
    @objc func tapRightArrow() {
        receiveTimeTextField.becomeFirstResponder()
    }
    @objc func tapLeftArrow() {
        amountTextField.becomeFirstResponder()
    }
}

extension ItemViewController: UIPickerViewDelegate {
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //label.text = dataList[row]
        switch PickerSource(rawValue: pickerView.tag)! {
        case .amount:
            amountTextField.text = amountPickerData[component][row]
        case .receiveTime:
            receiveTimeTextField.text = receivePickerData[component][row]
        }
    }
}

