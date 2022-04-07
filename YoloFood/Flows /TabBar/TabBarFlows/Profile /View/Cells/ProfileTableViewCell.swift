//
//  ProfileTableViewCell.swift
//  YoloFood
//
//  Created by beshssg on 13.03.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
// MARK: - UI Elements:
    
    lazy var titleLabel: UILabel = {
        $0.text = "YoloFood"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        $0.textColor = .green
        return $0
    }(UILabel())
    
    lazy var phoneNumberTextFiled: CustomTextField = {
        $0.placeholder = "Введите номер телефона"
        $0.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        return $0
    }(CustomTextField(padding: 16))
    
    lazy var continueButton: UIButton = {
        $0.setTitle("Продолжить", font: UIFont.systemFont(ofSize: 16, weight: .bold), color: .white)
        $0.backgroundColor = .green
        return $0
    }(UIButton(type: .system))
    
// MARK: - Lifecyle:
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureUI()
    }
}

// MARK: - ConfigureUI:

extension ProfileTableViewCell {
    
    func configureUI() {
        [titleLabel, phoneNumberTextFiled, continueButton].forEach {
            contentView.addSubview($0)
        }
        
        [phoneNumberTextFiled, continueButton].forEach {
            $0.layer.cornerRadius = 8
        }
        selectionStyle = .none
        makeConstraints()
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32.0)
            $0.centerX.equalToSuperview()
        }
        
        phoneNumberTextFiled.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextFiled.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
}
