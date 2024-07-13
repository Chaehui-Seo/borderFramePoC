//
//  ViewController.swift
//  borderFramePOC
//
//  Created by 서채희 on 6/16/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var targetView = makeTargetView()
    private lazy var secondTargetView = makeTargetView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Initial Setting
    /**
     set UI elements
     */
    func setupUI() {
        makeGrid()
        self.view.addSubview(targetView)
        self.view.addSubview(secondTargetView)
        NSLayoutConstraint.activate([
            targetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            targetView.widthAnchor.constraint(equalToConstant: 100),
            targetView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            targetView.heightAnchor.constraint(equalToConstant: 100),
            secondTargetView.leadingAnchor.constraint(equalTo: self.targetView.trailingAnchor, constant: 50),
            secondTargetView.widthAnchor.constraint(equalToConstant: 100),
            secondTargetView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            secondTargetView.heightAnchor.constraint(equalToConstant: 100),
        ])
        self.view.layoutIfNeeded()
        
//        let borderLayer = CALayer()
//        let borderWidth: CGFloat = 10
//        let borderFrame = CGRect(x: -(borderWidth / 2), y: -(borderWidth / 2),
//                                 width: targetView.frame.size.width + borderWidth,
//                                 height: targetView.frame.size.height + borderWidth)
//        borderLayer.frame = borderFrame
//        borderLayer.backgroundColor = UIColor.clear.cgColor
//        borderLayer.borderWidth = borderWidth
//        borderLayer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
//        borderLayer.cornerRadius = 20
//        targetView.layer.addSublayer(borderLayer)
//        
//        
//        let borderLayer2 = CALayer()
//        let borderWidth2: CGFloat = 10
//        let borderFrame2 = CGRect(x: -(borderWidth2), y: -(borderWidth2),
//                                 width: secondTargetView.frame.size.width + (borderWidth2 * 2),
//                                 height: secondTargetView.frame.size.height + (borderWidth2 * 2))
//        borderLayer2.frame = borderFrame2
//        borderLayer2.backgroundColor = UIColor.clear.cgColor
//        borderLayer2.borderWidth = borderWidth2
//        borderLayer2.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
//        borderLayer2.cornerRadius = 20
//        secondTargetView.layer.addSublayer(borderLayer2)
//        
//        targetView.layer.cornerRadius = 20
//        secondTargetView.layer.cornerRadius = 20
        
//        targetView.layer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
//        targetView.layer.borderWidth = 5
//        targetView.layer.cornerRadius = 10
//        targetView.layer.masksToBounds = true
//        self.view.layoutIfNeeded()
//        let layer = CAShapeLayer()
//        layer.path = targetView.getBezierPath()
//        layer.fillColor = UIColor.red.cgColor
//        targetView.layer.addSublayer(layer)
        
        targetView.setBorder(borderWidth: 10, borderColor: UIColor.red.withAlphaComponent(0.5).cgColor, cornerRadius: 20, type: .outside)
        secondTargetView.setBorder(borderWidth: 10, borderColor: UIColor.red.withAlphaComponent(0.5).cgColor, cornerRadius: 0, type: .inside)
        
//        // Outside
//        let borderLayer = CALayer()
//        let borderWidth: CGFloat = 5
//        let borderFrame = CGRect(x: -(borderWidth), y: -(borderWidth),
//                                 width: targetView.frame.size.width + (borderWidth * 2),
//                                 height: targetView.frame.size.height + (borderWidth * 2))
//        borderLayer.frame = borderFrame
//        borderLayer.backgroundColor = UIColor.clear.cgColor
//        borderLayer.borderWidth = borderWidth
//        borderLayer.borderColor = UIColor.black.cgColor
//        targetView.layer.addSublayer(borderLayer)
//        
//// Center
//let borderLayer = CALayer()
//let borderWidth: CGFloat = 5
//let borderFrame = CGRect(x: -(borderWidth / 2), y: -(borderWidth / 2),
//                         width: targetView.frame.size.width + borderWidth,
//                         height: targetView.frame.size.height + borderWidth)
//borderLayer.frame = borderFrame
//borderLayer.backgroundColor = UIColor.clear.cgColor
//borderLayer.borderWidth = borderWidth
//borderLayer.borderColor = UIColor.black.cgColor
//targetView.layer.addSublayer(borderLayer)
//        borderLayer.cornerRadius = targetView.layer.cornerRadius
//        borderLayer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
//        let testLayer = CAShapeLayer()
//        testLayer.frame = CGRect(x: -3, y: -3, width: targetView.frame.size.width + 3, height: targetView.frame.size.height + 3)
//        testLayer.backgroundColor = UIColor.yellow.withAlphaComponent(0.5).cgColor
//        testLayer.cornerRadius = 10
//        testLayer.fillRule = .evenOdd
////        borderLayer.mask = testLayer
////        targetView.layer.mask = testLayer
//        targetView.layer.cornerRadius = 10
    }
    
    /**
     Make gridlines whose spacings are 10
     */
    private func makeGrid() {
        var curX = 9.0
        while curX < self.view.frame.maxX {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemGray4
            self.view.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: curX),
                view.topAnchor.constraint(equalTo: self.view.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                view.widthAnchor.constraint(equalToConstant: 1)
            ])
            curX += 10
        }
        
        var curY = 9.0
        while curY < self.view.frame.maxY {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemGray4
            self.view.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: curY),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 1)
            ])
            curY += 10
        }
    }
    
    func makeTargetView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }
}
