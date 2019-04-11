//
//  ViewController.swift
//  ExampleSnowflakesAndFireworks
//
//  Created by Ivan Kramarchuk on 11/04/2019.
//  Copyright © 2019 homework.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sizeWidth: CGFloat = 200
    let sizeHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton(title: "Fireworks", backgroundColor: UIColor.red, topAncor: 100, selector: #selector(showFireworks))
        addButton(title: "Snowflakes", backgroundColor: UIColor.blue, topAncor: 200, selector: #selector(showSnowflakes))
    }
    
    func addButton(title: String, backgroundColor: UIColor, topAncor: CGFloat, selector: Selector) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: sizeWidth, height: sizeHeight))
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = backgroundColor
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: topAncor).isActive = true
        button.heightAnchor.constraint(equalToConstant: sizeHeight).isActive = true
        button.widthAnchor.constraint(equalToConstant: sizeWidth).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    @objc func showFireworks(sender: UIButton!) {
        self.removeEffects()
        self.addFireworks()
    }
    
    @objc func showSnowflakes(sender: UIButton!) {
        self.removeEffects()
        self.addSnowflakes()
    }


}

