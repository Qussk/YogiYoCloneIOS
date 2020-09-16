//
//  miniListCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class miniListCell : UITableViewCell{
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    
  }
  let miniMenuLable : UILabel = {
    let l = UILabel()
    l.text = "메뉴명"
    l.numberOfLines = 0
    l.font = FontModel.toSize.customFont
    l.textAlignment = .left
    return l
  }()
  
  let miniSubMenuLable : UILabel = {
    let l = UILabel()
    l.text = "어쩌구저쩌구"
    l.numberOfLines = 0
    l.font = FontModel.toSize.customSmallFont
    l.textColor = ColorPiker.customDarkGray
    l.textAlignment = .left
    return l
  }()
  
  let miniPriseLable : UILabel = {
    let l = UILabel()
    l.text = "000원"
    l.font = FontModel.toSize.customMediumFont
    l.textAlignment = .right
    return l
  }()
  
  
  
  func setUI(){
    [miniMenuLable,miniSubMenuLable,miniPriseLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      //   $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
      contentView.addSubview($0)
    }
  }
  
  func setConstraint(){
    NSLayoutConstraint.activate([
    
      miniMenuLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      miniMenuLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      miniMenuLable.trailingAnchor.constraint(equalTo: miniPriseLable.leadingAnchor),
      
      miniPriseLable.centerYAnchor.constraint(equalTo: miniMenuLable.centerYAnchor),
      miniPriseLable.leadingAnchor.constraint(equalTo: miniMenuLable.trailingAnchor),
      miniPriseLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      miniSubMenuLable.topAnchor.constraint(equalTo: miniMenuLable.bottomAnchor),
      miniSubMenuLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      miniSubMenuLable.trailingAnchor.constraint(equalTo: miniPriseLable.leadingAnchor),
      miniSubMenuLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      
      
    ])
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
