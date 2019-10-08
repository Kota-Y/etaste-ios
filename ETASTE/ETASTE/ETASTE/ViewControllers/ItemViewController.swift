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

class ItemViewController: UIViewController {
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
    
    @IBOutlet weak var handleImage: UIImageView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var receiveTimeTextField: UITextField!
    @IBOutlet weak var halfModalViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet var panGestureRecognizerOnHalfModalView: UIPanGestureRecognizer!
    @IBOutlet var halfModalViewsParts: [UIView]!
    
    @IBOutlet var imagesNeedPlaceHolder: [UIImageView]!
    @IBOutlet var labelsNeedPlaceHolder: [UILabel]!
    
    @IBOutlet weak var lowerViewTopConstraint: NSLayoutConstraint!
    let openLowerViewTopConstraint: CGFloat = 0
    let closeLowerViewTopConstraint: CGFloat = -130
    var isWhySaleTextOpen = true
    
    @IBOutlet weak var lowerViewHight: NSLayoutConstraint!
    
    let foodDetailModel = FoodDetailModel()
    let animation = Animation()
    
    var isHalfModalViewOpen = false
    var halfModalViewClosingHeight: CGFloat = 100.0
    var halfModalViewOpeningHeight: CGFloat = 260.0
    
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
        
        halfModalViewHeightConstraint.constant = halfModalViewClosingHeight
        handleImage.image = UIImage(named: "neutralHandleOnHalf-ModalView")
        fadeView.backgroundColor = UIColor.white
        fadeView.alpha = 1
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
                completion: {}
            )
            isHalfModalViewOpen = !isShouldBeClose
        default:
            break
        }
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
            lowerViewHight.constant += 43
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
