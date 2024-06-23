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


extension UIView {
    enum BorderType {
        case inside
        case center
        case outside
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat, type: BorderType) {
        let layer = CAShapeLayer()
        layer.fillColor = borderColor
        
        var minX: CGFloat = 0
        var maxX: CGFloat = self.frame.width
        var minY: CGFloat = 0
        var maxY: CGFloat = self.frame.height
        
        switch type {
        case .inside:
            self.layer.cornerRadius = cornerRadius
            break
        case .center:
            minX = -(borderWidth / 2)
            maxX = maxX + (borderWidth / 2)
            minY = -(borderWidth / 2)
            maxY = maxY + (borderWidth / 2)
            self.layer.cornerRadius = cornerRadius
        case .outside:
            minX = -(borderWidth)
            maxX = maxX + borderWidth
            minY = -(borderWidth)
            maxY = maxY + borderWidth
            self.layer.cornerRadius = (cornerRadius - borderWidth) // outside에 테두리를 추가할 경우, innerCorner에 맞춰서 뷰의 cornerRadius 조정
        }
        
        // 테두리의 바깥쪽 면
        let outerPath = getRoundCornerRectanglePath(cornerRadius: cornerRadius,
                                                    minX: minX,
                                                    minY: minY,
                                                    maxX: maxX,
                                                    maxY: maxY)
        // 테두리의 안쪽 면
        let innerPath = getRoundCornerRectanglePath(cornerRadius: max((cornerRadius - borderWidth), 0), // 음수일 경우 0으로 계산
                                                    minX: minX + borderWidth,
                                                    minY: minY + borderWidth,
                                                    maxX: maxX - borderWidth,
                                                    maxY: maxY - borderWidth)
        let intersectionPath = outerPath.subtracting(innerPath)
        layer.path = intersectionPath
        self.layer.addSublayer(layer)
    }
    
    private func getRoundCornerRectanglePath(cornerRadius: CGFloat, minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) -> CGMutablePath {
        let path = CGMutablePath()
        // 좌측 상단 - 시작점
        path.move(to: .init(x: minX, y: minY + cornerRadius))
        if cornerRadius > 0 { // 좌측 상단 모서리
            path.addArc(center: CGPoint(x: minX + cornerRadius, y: minY + cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: .pi * 3 / 2, clockwise: false)
        }
        
        // 우측 상단
        path.addLine(to: CGPoint(x: maxX - cornerRadius, y: minY))
        if cornerRadius > 0 { // 우측 상단 모서리
            path.addArc(center: CGPoint(x: maxX - cornerRadius, y: minY + cornerRadius), radius: cornerRadius, startAngle: .pi * 3 / 2, endAngle: .pi * 2, clockwise: false)
        }
        
        // 우측 하단
        path.addLine(to: CGPoint(x: maxX, y: maxY - cornerRadius))
        if cornerRadius > 0 { // 우측 하단 모서리
            path.addArc(center: CGPoint(x: maxX - cornerRadius, y: maxY - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        }
        
        // 좌측 하단
        path.addLine(to: CGPoint(x: minX + cornerRadius, y: maxY))
        if cornerRadius > 0 { // 좌측 하단 모서리
            path.addArc(center: CGPoint(x: minX + cornerRadius, y: maxY - cornerRadius), radius: cornerRadius, startAngle: .pi / 2, endAngle: .pi, clockwise: false)
        }
        
        // 좌측 상단으로 복귀하는 변 추가 - 끝점
        path.addLine(to: .init(x: minX, y: minY + cornerRadius))
        return path
    }
}
