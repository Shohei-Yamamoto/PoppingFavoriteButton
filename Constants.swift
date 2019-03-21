//
//  Constants.swift
//  PoppingFavoriteButton
//
//  Created by Shohei Yamamoto on 2019/03/21.
//

import UIKit

struct DOFavoriteConstants {
    static let circleKeyTimes: [NSNumber] = [
        0.0,    //  0/10
        0.1,    //  1/10
        0.2,    //  2/10
        0.3,    //  3/10
        0.4,    //  4/10
        0.5,    //  5/10
        0.6,    //  6/10
        1.0     // 10/10
    ]
    
    static let circleValues = [
        NSValue(caTransform3D: CATransform3DMakeScale(0.0,  0.0,  1.0)),    //  0/10
        NSValue(caTransform3D: CATransform3DMakeScale(0.5,  0.5,  1.0)),    //  1/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.0,  1.0,  1.0)),    //  2/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.2,  1.2,  1.0)),    //  3/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.3,  1.3,  1.0)),    //  4/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.37, 1.37, 1.0)),    //  5/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.4,  1.4,  1.0)),    //  6/10
        NSValue(caTransform3D: CATransform3DMakeScale(1.4,  1.4,  1.0))     // 10/10
    ]
    
    static let circleMaskKeyTimes: [NSNumber] = [
        0.0,    //  0/10
        0.2,    //  2/10
        0.3,    //  3/10
        0.4,    //  4/10
        0.5,    //  5/10
        0.6,    //  6/10
        0.7,    //  7/10
        0.9,    //  9/10
        1.0     // 10/10
    ]
    
    static func circleMaskValues(imageFrame: CGRect) -> [NSValue] { return [
        NSValue(caTransform3D: CATransform3DIdentity),                                                              //  0/10
        NSValue(caTransform3D: CATransform3DIdentity),                                                              //  2/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 1.25,  imageFrame.height * 1.25,  1.0)),   //  3/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 2.688, imageFrame.height * 2.688, 1.0)),   //  4/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 3.923, imageFrame.height * 3.923, 1.0)),   //  5/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 4.375, imageFrame.height * 4.375, 1.0)),   //  6/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 4.731, imageFrame.height * 4.731, 1.0)),   //  7/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 5.0,   imageFrame.height * 5.0,   1.0)),   //  9/10
        NSValue(caTransform3D: CATransform3DMakeScale(imageFrame.width * 5.0,   imageFrame.height * 5.0,   1.0))    // 10/10
    ]}
    
    static func getCircleShape(frame: CGRect, centerPoint: CGPoint, color: UIColor) -> CAShapeLayer {
        let circleShape = CAShapeLayer()
        circleShape.bounds = frame
        circleShape.position = centerPoint
        circleShape.path = UIBezierPath(ovalIn: frame).cgPath
        circleShape.fillColor = color.cgColor
        circleShape.transform = CATransform3DMakeScale(0.0, 0.0, 1.0)
        
        return circleShape
    }
    
    static func getCircleMask(frame: CGRect, centerPoint: CGPoint) -> CAShapeLayer {
        let circleMask = CAShapeLayer()
        circleMask.bounds = frame
        circleMask.position = centerPoint
        circleMask.fillRule = CAShapeLayerFillRule.evenOdd
        
        let maskPath = UIBezierPath(rect: frame)
        maskPath.addArc(withCenter: centerPoint, radius: 0.1, startAngle: CGFloat(0.0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circleMask.path = maskPath.cgPath
        
        return circleMask
    }
    
    static let lineStrokeStartKeyTimes: [NSNumber]  = [
        0.0,    //  0/18
        0.056,  //  1/18
        0.111,  //  2/18
        0.167,  //  3/18
        0.222,  //  4/18
        0.278,  //  5/18
        0.333,  //  6/18
        0.389,  //  7/18
        0.444,  //  8/18
        0.944,  // 17/18
        1.0,    // 18/18
    ]
    
    static let lineStrokeStartValues = [
        0.0,    //  0/18
        0.0,    //  1/18
        0.18,   //  2/18
        0.2,    //  3/18
        0.26,   //  4/18
        0.32,   //  5/18
        0.4,    //  6/18
        0.6,    //  7/18
        0.71,   //  8/18
        0.89,   // 17/18
        0.92    // 18/18
    ]
    
    static let lineStrokeEndKeyTimes: [NSNumber]  = [
        0.0,    //  0/18
        0.056,  //  1/18
        0.111,  //  2/18
        0.167,  //  3/18
        0.222,  //  4/18
        0.278,  //  5/18
        0.944,  // 17/18
        1.0,    // 18/18
    ]
    
    static let lineStrokeEndValues = [
        0.0,    //  0/18
        0.0,    //  1/18
        0.32,   //  2/18
        0.48,   //  3/18
        0.64,   //  4/18
        0.68,   //  5/18
        0.92,   // 17/18
        0.92    // 18/18
    ]
    
    static let lineOpacityKeyTimes: [NSNumber]  = [
        0.0,    //  0/30
        0.4,    // 12/30
        0.567   // 17/30
    ]
    
    static let lineOpacityValues = [
        1.0,    //  0/30
        1.0,    // 12/30
        0.0     // 17/30
    ]

    static func getLines(frame: CGRect, centerPoint: CGPoint) -> [CAShapeLayer] {
        var lines: [CAShapeLayer] = []
        for i in 0 ..< 5 {
            let line = CAShapeLayer()
            line.bounds = frame
            line.position = centerPoint
            line.masksToBounds = true
            line.actions = ["strokeStart": NSNull(), "strokeEnd": NSNull()]
            line.strokeColor = UIColor.black.cgColor
            line.lineWidth = 1.25
            line.miterLimit = 1.25
            line.path = {
                let path = CGMutablePath()
                path.move(to: CGPoint(x: frame.midX, y: frame.midY))
                path.addLine(to: CGPoint(x: frame.origin.x + frame.width / 2, y: frame.origin.y))
                return path
            }()
            line.lineCap = CAShapeLayerLineCap.round
            line.lineJoin = CAShapeLayerLineJoin.round
            line.strokeStart = 0.0
            line.strokeEnd = 0.0
            line.opacity = 0.0
            line.transform = CATransform3DMakeRotation(CGFloat(Double.pi / 5) * (CGFloat(i) * 2 + 1), 0.0, 0.0, 1.0)
            lines.append(line)
        }
        
        return lines
    }
    
    static let imageKeyTimes: [NSNumber] = [
        0.0,    //  0/30
        0.1,    //  3/30
        0.3,    //  9/30
        0.333,  // 10/30
        0.367,  // 11/30
        0.467,  // 14/30
        0.5,    // 15/30
        0.533,  // 16/30
        0.567,  // 17/30
        0.667,  // 20/30
        0.7,    // 21/30
        0.733,  // 22/30
        0.833,  // 25/30
        0.867,  // 26/30
        0.9,    // 27/30
        0.967,  // 29/30
        1.0     // 30/30
    ]
    
    static let imageValues = [
        NSValue(caTransform3D: CATransform3DMakeScale(0.0,   0.0,   1.0)),  //  0/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.0,   0.0,   1.0)),  //  3/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.2,   1.2,   1.0)),  //  9/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.25,  1.25,  1.0)),  // 10/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.2,   1.2,   1.0)),  // 11/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.9,   0.9,   1.0)),  // 14/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.875, 0.875, 1.0)),  // 15/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.875, 0.875, 1.0)),  // 16/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.9,   0.9,   1.0)),  // 17/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.013, 1.013, 1.0)),  // 20/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.025, 1.025, 1.0)),  // 21/30
        NSValue(caTransform3D: CATransform3DMakeScale(1.013, 1.013, 1.0)),  // 22/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.96,  0.96,  1.0)),  // 25/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.95,  0.95,  1.0)),  // 26/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.96,  0.96,  1.0)),  // 27/30
        NSValue(caTransform3D: CATransform3DMakeScale(0.99,  0.99,  1.0)),  // 29/30
        NSValue(caTransform3D: CATransform3DIdentity)                       // 30/30
    ]
}
