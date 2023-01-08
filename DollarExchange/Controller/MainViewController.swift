//
//  MainViewController.swift
//  DollarExchange
//
//  Created by Abdulbosid Jalilov on 08/01/23.
//

import UIKit
import Lottie
import SnapKit

class MainViewController: UIViewController {
    
    //MARK: - Lottie Animation
    var animationView = LottieAnimationView(name: "welcome")
    
    
    //MARK: - Greeting Label
    let mainLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome to the National Bank of Uzbekistan"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let enterButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(enterButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView(){
        
        //MARK: - Greeting Label Frames
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.25)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
        }
        
        //MARK: - Animation
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        //MARK: - Enter Button
        view.addSubview(enterButton)
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
            make.height.equalTo(view.snp.height).multipliedBy(0.06)
        }
        
    }
    
    //MARK: - Func Enter Button Clicked
    @objc func enterButtonClicked(){
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
