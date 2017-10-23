//
//  CircleProgressView.swift
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/10/23.
//  Copyright © 2017年 Juny. All rights reserved.
//

import UIKit



class CircleProgressView: UIView {
    let line_width = 15.0
    var isGreen : Bool?
    

    var progressLayer : CAShapeLayer = CAShapeLayer()
    var percent : NSInteger = 0
    
    let checkImageView : UIImageView = UIImageView.init(image: UIImage.init(named: "logo"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isGreen = true
        
        checkImageView.frame = CGRect.init(x: self.frame.size.width-CGFloat( line_width), y: self.frame.size.height, width: 20, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews()  {
        self.backgroundColor = UIColor.clear
        
        
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius:CGFloat( self.frame.size.width/2.0)-CGFloat( line_width), startAngle: CGFloat(degreesToRadians(degrees: 0.0)), endAngle: CGFloat(degreesToRadians(degrees: -360.0)), clockwise: false)
        
        
        //灰色的背景图层
//        let trackLayer = CAShapeLayer()
//        trackLayer.frame = self.bounds
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.strokeColor = UIColor.gray.cgColor//指定path的渲染色
//        trackLayer.opacity = 0.25
//        trackLayer.lineCap = kCALineCapRound //指定线的边缘是圆的
//        trackLayer.lineWidth = CGFloat(line_width)
//        trackLayer.path = path.cgPath
//        self.layer.addSublayer(trackLayer)
        
        
        //进度图层
   
        progressLayer.frame = self.bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.orange.cgColor//指定path的渲染色
        progressLayer.lineCap = kCALineCapRound //指定线的边缘是圆的
        progressLayer.lineWidth = CGFloat(line_width)
        progressLayer.path = path.cgPath
        progressLayer.strokeEnd = 0.0
        
        
        let bgLayer : CAShapeLayer = CAShapeLayer()
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = self.bounds
        
        //设置颜色
        if isGreen! {
           
            let leftColor : CGColor = UIColor.init(colorLiteralRed: 96/255.0, green: 191/255.0, blue: 234/255.0, alpha: 1).cgColor
            let rightColor : CGColor = UIColor.init(colorLiteralRed: 88/255.0, green: 238/255.0, blue: 189/255.0, alpha: 1).cgColor
           gradientLayer.colors = [leftColor,rightColor]
        }else{
            let leftColor : CGColor = UIColor.init(colorLiteralRed: 233/255.0, green: 159/255.0, blue: 167/255.0, alpha: 1).cgColor
            let rightColor : CGColor = UIColor.init(colorLiteralRed: 247/255.0, green: 220/255.0, blue: 166/255.0, alpha: 1).cgColor
            gradientLayer.colors = [leftColor,rightColor]
        }
        
        gradientLayer.locations = [NSNumber.init(value: 0.2),NSNumber.init(value: 0.8)]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        bgLayer.addSublayer(gradientLayer)
        self.layer.addSublayer(gradientLayer)
        
        gradientLayer.mask = progressLayer

        self.addSubview(checkImageView)
      
    }
    
    
    func setProgressAnimation(_ progress: NSInteger, animation myAniation: Bool)  {
      
        percent = progress
        progressLayer.strokeEnd =  CGFloat(Double( percent)/100.0)
        
        
        
        //checkImageView
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius:CGFloat( self.frame.size.width/2.0)-CGFloat( line_width), startAngle: CGFloat(degreesToRadians(degrees: 0.0)), endAngle: CGFloat(degreesToRadians(degrees: -360.0*(Double( percent)/100.0))), clockwise: false)
        
        let centerX =  self.bounds.size.width/2
        let boundingRect:CGRect = self.bounds
        
        let orbit = CAKeyframeAnimation(keyPath:"position")
        orbit.duration = 0.25
        orbit.path = path.cgPath
        orbit.calculationMode = kCAAnimationPaced
        orbit.isRemovedOnCompletion = false
        orbit.fillMode = kCAFillModeForwards
        
        checkImageView.layer.add(orbit,forKey:"Move")
        
       
    }
    
    func degreesToRadians(degrees : Double) -> Double {
        let radians = M_PI*degrees/180.0
        return radians
        
    }

}
