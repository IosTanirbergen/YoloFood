//
//  PersonalProfileViewController.swift
//  YoloFood
//
//  Created by Zhanibek Santay on 16.06.2022.
//

import UIKit

class PersonalProfileViewController: UIViewController {

    private let imageCardView: UIView = {
       let view = UIView()
       view.backgroundColor = .white
       return view
    }()
    
    private let titleLabel: UILabel = {
        let lb = CustomLabel(textSize: 20.0, color: .black, fonts: .medium)
        lb.text = "Yessie"
        return lb
    }()
    
    private let subtitle: UILabel = {
        let lb = CustomLabel(textSize: 12.0, color: .black, fonts: .regular)
        lb.text = "yessieklein@gmail.com"
        return lb
    }()
    
    private let descriptions: UILabel = {
        let lb = CustomLabel(textSize: 11.0, color: .black, fonts: .regular)
        lb.text = "Member No. 1239475605"
        return lb
    }()
    
    private let profileImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "Rectangle 2")
       return image
    }()
    
    private let buttonEdit: UIButton = {
       let button = UIButton()
       button.setImage(UIImage(named: "Vector"), for: .normal)
       return button
    }()
    
    private let activityView: ProfileCardView = {
        let view = ProfileCardView(type: .activiy(firstTitle: "Месяцы", firstPrice: "3", secondTitle: "Недели", secondPrice: "0", thirdTitle: "Дни", thirdPrice: "5"))
       view.backgroundColor = UIColor(red: 33/255.0, green: 140/255.0, blue: 192/255.0, alpha: 1)
        view.layer.masksToBounds = true
        view.alpha = 0.5
        view.layer.cornerRadius = 10
       return view
    }()
    
    private let activityLabel: UILabel = {
        let activity = CustomLabel(textSize: 20.0, color: .black, fonts: .bold)
        activity.text = "Активность"
        return activity
    }()

    private let searchView: ProfileCardView = {
        let view = ProfileCardView(type: .other(firstTitle: "Current", firstPrice: "3", secondTitle: "Pending", secondPrice: "0", thirdTitle: "History", thirdPrice: "5"))
        view.backgroundColor = UIColor(red: 197/255.0, green: 42/255.0, blue: 53/255.0, alpha: 1)
        view.alpha = 0.5
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
       return view
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchLabel: UILabel = {
        let activity = CustomLabel(textSize: 20.0, color: .black, fonts: .bold)
        activity.text = "Подписка на сервисы"
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureCastleView()
        let geasture = UITapGestureRecognizer(target: self, action: #selector(tapGeasture))
        imageCardView.addGestureRecognizer(geasture)
    }
    
    @objc func tapGeasture() {
        let controller = DetailProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func configureCastleView() {
        ["Сервисы", "Оплата", "Язык", "Помощь"].forEach { items in
            let castleView = CastleView(title: items, price: items)
            castleView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
            self.stackView.addArrangedSubview(castleView)
        }
    }
    
    func setupViews() {
        view.addSubview(imageCardView)
        imageCardView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100.0)
            make.height.equalTo(150.0)
        }
        
        imageCardView.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        imageCardView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.left.equalTo(profileImage.snp.right).offset(32.0)
        }
        
        imageCardView.addSubview(subtitle)
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalTo(profileImage.snp.right).offset(32.0)
        }
        
        imageCardView.addSubview(descriptions)
        descriptions.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(12)
            make.left.equalTo(profileImage.snp.right).offset(32.0)
        }
        
        imageCardView.addSubview(buttonEdit)
        buttonEdit.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-22)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.size.equalTo(CGSize(width: 17, height: 17))
        }
        
        view.addSubview(activityLabel)
        activityLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(29)
            make.top.equalTo(imageCardView.snp.bottom)
        }
        
        view.addSubview(activityView)
        activityView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(30)
            make.top.equalTo(activityLabel.snp.bottom).offset(8)
            make.height.equalTo(92)
        }
        
        view.addSubview(searchLabel)
        searchLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(29)
            make.top.equalTo(activityView.snp.bottom).offset(12)
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(30)
            make.top.equalTo(searchLabel.snp.bottom).offset(8)
            make.height.equalTo(92)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
    }
}

enum ProfileTypeCardType {
    case activiy(firstTitle: String, firstPrice: String, secondTitle: String, secondPrice:String, thirdTitle: String, thirdPrice: String)
    case other(firstTitle: String, firstPrice: String, secondTitle: String, secondPrice:String, thirdTitle: String, thirdPrice: String)
}

class ProfileCardView: UIView {
   
    var type: ProfileTypeCardType?
    var firstLabel: UILabel = {
       let lb = CustomLabel(textSize: 12.0, color: .black, fonts: .bold)
       return lb
    }()
    
    var firstPriceLabel: UILabel = {
       let lb = CustomLabel(textSize: 20.0, color: .blue, fonts: .bold)
       return lb
    }()
    
    var secondLabel: UILabel = {
       let lb = CustomLabel(textSize: 12.0, color: .black, fonts: .bold)
       return lb
    }()
    
    var secondPriceLabel: UILabel = {
       let lb = CustomLabel(textSize: 20.0, color: .blue, fonts: .bold)
       return lb
    }()
    
    var thirdLabel: UILabel = {
       let lb = CustomLabel(textSize: 12.0, color: .black, fonts: .bold)
       return lb
    }()
    
    var thirdPriceLabel: UILabel = {
       let lb = CustomLabel(textSize: 20.0, color: .blue, fonts: .bold)
       return lb
    }()
    
    
    init(type: ProfileTypeCardType) {
       self.type = type
       super.init(frame: .zero)
        switch self.type {
        case .activiy(let firstTitle, let firstPrice, let secondTitle, let secondPrice, let thirdTitle, let thirdPrice):
            self.firstLabel.text = firstTitle
            self.firstPriceLabel.text = firstPrice
            self.secondLabel.text = secondTitle
            self.secondPriceLabel.text = secondPrice
            self.thirdLabel.text = thirdTitle
            self.thirdPriceLabel.text = thirdPrice
        case .other(let firstTitle, let firstPrice, let secondTitle, let secondPrice, let thirdTitle, let thirdPrice):
            self.firstLabel.text = firstTitle
            self.firstPriceLabel.text = firstPrice
            self.secondLabel.text = secondTitle
            self.secondPriceLabel.text = secondPrice
            self.thirdLabel.text = thirdTitle
            self.thirdPriceLabel.text = thirdPrice
        default:
            ()
        }
       setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
       addSubview(firstLabel)
        firstLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(20)
        }
        
        addSubview(firstPriceLabel)
        firstPriceLabel.snp.makeConstraints { make in
            make.centerX.equalTo(firstLabel.snp.centerX)
            make.top.equalTo(firstLabel.snp.bottom).offset(8)
        }
        
        addSubview(thirdLabel)
        thirdLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(20)
        }
        
        addSubview(thirdPriceLabel)
        thirdPriceLabel.snp.makeConstraints { make in
            make.centerX.equalTo(thirdLabel.snp.centerX)
            make.top.equalTo(thirdLabel.snp.bottom).offset(8)
        }
        
        addSubview(secondLabel)
        secondLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        addSubview(secondPriceLabel)
        secondPriceLabel.snp.makeConstraints { make in
            make.centerX.equalTo(secondLabel.snp.centerX)
            make.top.equalTo(secondLabel.snp.bottom).offset(8)
        }
    }
}


class CastleView: UIView  {
    
    private var titleLabel: CustomLabel = {
      let title = CustomLabel(textSize: 20.0, color: .black, fonts: .bold)
      return title
    }()
    
    private var buttonTitle: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 17
        
        button.layer.masksToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.setTitle("3", for: .normal)
       return button
    }()
    
    init(title: String, price: String) {
        self.titleLabel.text = title
        super.init(frame: .zero)
        
        addSubview(titleLabel)
        addSubview(buttonTitle)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().offset(29)
        }
        
        addSubview(buttonTitle)
        buttonTitle.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.size.equalTo(CGSize(width: 37, height: 37))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
