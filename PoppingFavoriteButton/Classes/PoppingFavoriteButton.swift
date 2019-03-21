import UIKit

open class PoppingFavoriteButton: UIButton {
    
    @IBInspectable open var colorOn: UIColor = .blue
    @IBInspectable open var colorOff: UIColor = .lightGray
    @IBInspectable open var lineColor: UIColor = .black
    @IBInspectable open var circleColor: UIColor = .blue
    
    override open var isSelected: Bool {
        didSet {
            self.tintColor = isSelected ? colorOn : colorOff
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createLayers()
        createAnimations()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createLayers()
        createAnimations()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.isSelected = !self.isSelected
        
        if isSelected {


            CATransaction.begin()

            circleShape.add(circleTransform, forKey: "transform")
            circleMask.add(circleMaskTransform, forKey: "transform")
            imageView?.layer.add(imageTransform, forKey: imageTransform.keyPath)
            
            for i in 0 ..< 5 {
                lines[i].add(lineStrokeStart, forKey: "strokeStart")
                lines[i].add(lineStrokeEnd, forKey: "strokeEnd")
                lines[i].add(lineOpacity, forKey: "opacity")
            }
            CATransaction.commit()

        }
        
        print(isTouchInside)

        guard let touchedPoint = touches.first?.location(in: self), self.bounds.contains(touchedPoint) else {
            print("outside")
            return
        }
    }
    
    // MARK: Layers
    fileprivate var circleShape: CAShapeLayer!
    fileprivate var circleMask: CAShapeLayer!
    fileprivate var lines: [CAShapeLayer]!
    
    // MARK: Animation Variables
    fileprivate let circleTransform = CAKeyframeAnimation(keyPath: "transform")
    fileprivate let circleMaskTransform = CAKeyframeAnimation(keyPath: "transform")
    fileprivate let lineStrokeStart = CAKeyframeAnimation(keyPath: "strokeStart")
    fileprivate let lineStrokeEnd = CAKeyframeAnimation(keyPath: "strokeEnd")
    fileprivate let lineOpacity = CAKeyframeAnimation(keyPath: "opacity")
    fileprivate let imageTransform = CAKeyframeAnimation(keyPath: "transform")

    
    private func createLayers() {
        self.layer.sublayers = nil
        self.imageView?.layer.sublayers = nil
        
        guard let imageFrame = imageView?.frame, let imageCenterPoint = imageView?.center else {
            return
        }
        
        let lineFrame = CGRect(x: imageFrame.origin.x - imageFrame.width / 4, y: imageFrame.origin.y - imageFrame.height / 4 , width: imageFrame.width * 1.5, height: imageFrame.height * 1.5)
        
        // MARK: Circle Layer
        circleShape = DOFavoriteConstants.getCircleShape(frame: imageFrame, centerPoint: imageCenterPoint, color: .yellow)
        self.layer.addSublayer(circleShape)
    
        circleMask = DOFavoriteConstants.getCircleMask(frame: imageFrame, centerPoint: imageCenterPoint)
        circleShape.mask = circleMask

        // MARK: Line Layer
        lines = DOFavoriteConstants.getLines(frame: lineFrame, centerPoint: imageCenterPoint)
        lines.forEach{self.layer.addSublayer($0)}
    }
    
    private func createAnimations() {
        guard let imageFrame = imageView?.frame else {
            return
        }
        
        // MARK: Circle Layer Animations
        circleTransform.duration = 0.333 // 0.0333 * 10
        circleTransform.values = DOFavoriteConstants.circleValues
        circleTransform.keyTimes = DOFavoriteConstants.circleKeyTimes
        
        circleMaskTransform.duration = 0.333 // 0.0333 * 10
        circleMaskTransform.values = DOFavoriteConstants.circleMaskValues(imageFrame: imageFrame)
        circleMaskTransform.keyTimes = DOFavoriteConstants.circleMaskKeyTimes
        
        // MARK: Line Layer Animations
        lineStrokeStart.duration = 0.6 //0.0333 * 18
        lineStrokeStart.values = DOFavoriteConstants.lineStrokeStartValues
        lineStrokeStart.keyTimes = DOFavoriteConstants.lineStrokeStartKeyTimes
        
        lineStrokeEnd.duration = 0.6 //0.0333 * 18
        lineStrokeEnd.values = DOFavoriteConstants.lineStrokeEndValues
        lineStrokeEnd.keyTimes = DOFavoriteConstants.lineStrokeEndKeyTimes
        
        lineOpacity.duration = 1.0 //0.0333 * 30
        lineOpacity.values = DOFavoriteConstants.lineOpacityValues
        lineOpacity.keyTimes = DOFavoriteConstants.lineOpacityKeyTimes
        
        // MARK: Image Animations
        imageTransform.duration = 1.0 //0.0333 * 30
        imageTransform.values = DOFavoriteConstants.imageValues
        imageTransform.keyTimes = DOFavoriteConstants.imageKeyTimes
    }

}
