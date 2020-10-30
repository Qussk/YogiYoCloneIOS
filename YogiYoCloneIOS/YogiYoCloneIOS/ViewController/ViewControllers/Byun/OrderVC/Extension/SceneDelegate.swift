//
//  SceneDelegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/30.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension OderVC : UISceneDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > 800 {
      scrollView.contentOffset.y = 840
      paymentButton.isHidden = false
    }else{
      paymentButton.isHidden = true
    }
  }
}

