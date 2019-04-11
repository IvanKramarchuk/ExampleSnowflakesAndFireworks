//
//  extensionUIViewController.swift
//  ExampleSnowflakesAndFireworks
//
//  Created by Ivan Kramarchuk on 11/04/2019.
//  Copyright © 2019 homework.com. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addFireworks() {
        self.view.backgroundColor = UIColor.black
        print(self.view.frame.size.width/2)
        let emitterLayer: CAEmitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width/2, y: 20)
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive
        let emitterCell = CAEmitterCell()
        emitterCell.emissionLongitude = CGFloat(Double.pi / 2)
        emitterCell.emissionLatitude = 0
        emitterCell.lifetime = 2.6
        emitterCell.birthRate = 6
        emitterCell.velocity = 300
        emitterCell.velocityRange = 100
        emitterCell.yAcceleration = 150
        emitterCell.emissionRange = CGFloat(Double.pi / 4)
        let newColor = CGColor(_colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 0.5);
        emitterCell.color = newColor;
        emitterCell.redRange = 0.9;
        emitterCell.greenRange = 0.9;
        emitterCell.blueRange = 0.9;
        emitterCell.name = "base"
        let flareCell =  CAEmitterCell()
        flareCell.contents = UIImage(named: "particle.png")?.cgImage;
        flareCell.emissionLongitude = CGFloat(4 * Double.pi) / 2;
        flareCell.scale = 0.4;
        flareCell.velocity = 80;
        flareCell.birthRate = 45;
        flareCell.lifetime = 0.5;
        flareCell.yAcceleration = -350;
        flareCell.emissionRange = CGFloat(Double.pi / 7);
        flareCell.alphaSpeed = -0.7;
        flareCell.scaleSpeed = -0.1;
        flareCell.scaleRange = 0.1;
        flareCell.beginTime = 0.01;
        flareCell.duration = 1.7;
        let fireworkCell = CAEmitterCell()
        fireworkCell.contents = UIImage(named: "particle.png")?.cgImage;
        fireworkCell.birthRate = 19999;
        fireworkCell.scale = 0.6;
        fireworkCell.velocity = 130;
        fireworkCell.lifetime = 100;
        fireworkCell.alphaSpeed = -0.2;
        fireworkCell.yAcceleration = -80;
        fireworkCell.beginTime = 1.5;
        fireworkCell.duration = 0.1;
        fireworkCell.emissionRange = 2 * CGFloat(Double.pi);
        fireworkCell.scaleSpeed = -0.1;
        fireworkCell.spin = 2;
        emitterCell.emitterCells = [flareCell,fireworkCell]
        emitterLayer.emitterCells = [emitterCell]
        view.layer.addSublayer(emitterLayer)
    }
    
    func addSnowflakes() {
        self.view.backgroundColor = UIColor.white
        let particleEmitter = CAEmitterLayer()
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)
        let yellow = makeEmitterCell(color: UIColor.yellow)
        let white = makeEmitterCell(color: UIColor.white)
        particleEmitter.emitterCells = [red, green, blue, yellow, white]
        view.layer.addSublayer(particleEmitter)
    }
    
    private func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLatitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 2
        cell.scale = 0.1
        cell.scaleSpeed = -0.05
        cell.contents = UIImage(named: "icons8-winter-80.png")?.cgImage
        return cell
    }
    
    func removeEffects() {
        self.view.layer.sublayers?.forEach {
            if let item: CAEmitterLayer = $0 as? CAEmitterLayer {
                item.removeFromSuperlayer()
            }
        }
    }
    
}
