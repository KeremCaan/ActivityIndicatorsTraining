//
//  ViewController.swift
//  NeonAcademyActivityIndicators
//
//  Created by Kerem Caan on 1.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let label: UILabel = UILabel()
    var timer = Timer()
    var count = 0
    var colorArr: [UIColor] = [.black, .red, .gray, .green, .yellow, .brown, .cyan, .magenta, .orange, .purple]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    func configureUI() {
        
        view.addSubview(label)
        label.text = "0"
        label.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(250)
            make.centerX.equalToSuperview()
        }
        Count()
        view.addSubview(indicator)
        indicator.style = .large
        indicator.startAnimating()
        indicator.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.centerX.equalToSuperview()
            
        }
    }
    
    func Count() {
        if count < 100 {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
        }
    }
    
    @objc func counting() {
        if count < 100 {
            count += 1
            label.text = "\(count)"
            Count()
            if count % 10 == 0 {
                indicator.color = colorArr.randomElement()
            }
        } else {
            indicator.isHidden = true
            timer.invalidate()
            label.text = "100"
        }
    }

}

