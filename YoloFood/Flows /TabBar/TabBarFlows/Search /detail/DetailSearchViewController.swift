//
//  DetailSearchViewController.swift
//  YoloFood
//
//  Created by Zhanibek Santay on 20.06.2022.
//

import UIKit

class DetailSearchViewController: UIViewController {

    let detailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "123")
        image.layer.cornerRadius = 80
        image.layer.masksToBounds = true
        return image
    }()
    
    let labels: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.text = "«Мы делаем все необходимое,чтобы правильное питание было доступным».\nКухня Health-food работает на базе одного из лучших ресторанов Алматы. Мы готовим питание ночью, чтобы утром доставить готовые блюда максимально свежими до двери вашего дома или офиса. На нашей кухне работают проверенные годами повара, что позволяет быть всегда довольными нашим постоянным клиентам."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [detailImage, labels].forEach { self.view.addSubview($0) }
        
        detailImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(160)
        }
        
        labels.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(32)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
