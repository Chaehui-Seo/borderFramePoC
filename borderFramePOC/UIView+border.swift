//
//  UIView+border.swift
//  borderFramePOC
//
//  Created by 서채희 on 7/13/24.
//

import UIKit

extension UIView {
    enum BorderType {
        case inside
        case center
        case outside
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat, type: BorderType) {
        self.layer.cornerRadius = cornerRadius
        
        let layer = CAShapeLayer()
        layer.fillColor = borderColor
        
        // inside 기준으로 세팅
        var minX: CGFloat = 0
        var maxX: CGFloat = self.frame.width
        var minY: CGFloat = 0
        var maxY: CGFloat = self.frame.height
        var outerCornerRadius: CGFloat = cornerRadius
        var innerCorneRadius: CGFloat = cornerRadius - borderWidth
        
        switch type {
        case .inside:
            break
        case .center:
            minX = -(borderWidth / 2)
            maxX = maxX + (borderWidth / 2)
            minY = -(borderWidth / 2)
            maxY = maxY + (borderWidth / 2)
            outerCornerRadius = cornerRadius + (borderWidth / 2)
            innerCorneRadius = cornerRadius - (borderWidth / 2)
        case .outside:
            minX = -(borderWidth)
            maxX = maxX + borderWidth
            minY = -(borderWidth)
            maxY = maxY + borderWidth
            outerCornerRadius = cornerRadius + borderWidth
            innerCorneRadius = cornerRadius
        }
        
        // 테두리의 안쪽 면
        let innerPath = getRoundCornerRectanglePath(cornerRadius: max(innerCorneRadius, 0), // 음수일 경우 0으로 계산
                                                    minX: minX + borderWidth,
                                                    minY: minY + borderWidth,
                                                    maxX: maxX - borderWidth,
                                                    maxY: maxY - borderWidth)
        // 테두리의 바깥쪽 면
        let outerPath = getRoundCornerRectanglePath(cornerRadius: outerCornerRadius,
                                                    minX: minX,
                                                    minY: minY,
                                                    maxX: maxX,
                                                    maxY: maxY)
        
        let intersectionPath = outerPath.subtracting(innerPath)
        layer.path = intersectionPath
        self.layer.addSublayer(layer)
    }
    
    /**
     사각형/둥근 사각형 뷰 path 구하기
     */
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
