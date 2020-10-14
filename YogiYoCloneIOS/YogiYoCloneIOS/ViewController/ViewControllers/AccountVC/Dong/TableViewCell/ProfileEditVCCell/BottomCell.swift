//
//  BottomCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
<<<<<<< HEAD
=======
import Alamofire
>>>>>>> develop

class BottomCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "BottomCellID"
    
    private let topDeviderView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
<<<<<<< HEAD
    let logoutButton: UIButton = {
=======
    public let logoutButton: UIButton = {
>>>>>>> develop
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
<<<<<<< HEAD
    private let leaveButton: UIButton = {
=======
    public let leaveButton: UIButton = {
>>>>>>> develop
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    private let deviderView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
<<<<<<< HEAD
        
=======
        selectionStyle = .none
>>>>>>> develop
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [logoutButton, leaveButton, deviderView, topDeviderView].forEach {
            addSubview($0)
        }
        
        leaveButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(15)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
<<<<<<< HEAD
        logoutButton.snp.makeConstraints { (make) in
=======
        logoutButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
>>>>>>> develop
            make.top.equalToSuperview().inset(20)
            make.right.equalTo(self.leaveButton.snp.left).offset(-18)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
<<<<<<< HEAD
        deviderView.snp.makeConstraints { (make) in
=======
        deviderView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
>>>>>>> develop
            make.centerY.equalTo(self.logoutButton.snp.centerY)
            make.left.equalTo(self.logoutButton.snp.right).offset(9)
            make.width.equalTo(1)
            make.height.equalTo(9)
        }
        
        topDeviderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.3)
        }
    }
}
