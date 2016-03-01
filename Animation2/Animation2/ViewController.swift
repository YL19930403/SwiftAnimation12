//
//  ViewController.swift
//  Animation2
//
//  Created by 余亮 on 16/3/1.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var LoginLabel: UILabel!
    
    @IBOutlet weak var AccountF: UITextField!
    
    @IBOutlet weak var PasswordF: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    let info  = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        info.frame = CGRect(x: 0.0, y: LoginBtn.center.y + 60, width: view.frame.size.width, height: 30)
        info.backgroundColor = UIColor.clearColor()
        info.font = UIFont(name: "HelveticaNeue", size: 12.0)
        info.textAlignment = NSTextAlignment.Center
        info.textColor = UIColor.whiteColor()
        info.text = "Tap on a field and enter username and password"
        view.insertSubview(info, belowSubview: LoginBtn)
        
        AccountF.delegate = self
        PasswordF.delegate = self
    
}
    
    override func viewDidAppear(animated: Bool) {
        let basic = CABasicAnimation(keyPath: "position.x")
        basic.duration = 0.7
        basic.fromValue =  -view.bounds.size.width/2
        basic.toValue = view.bounds.width/2
        basic.fillMode = kCAFillModeBoth
        basic.delegate = self
        
        //basic.removedOnCompletion = false  //停留在动画最后的位置 而不是其实放得位置
        basic.setValue(LoginLabel.layer, forKey: "layer")
        LoginLabel.layer.addAnimation(basic, forKey: nil )
        
        basic.beginTime = CACurrentMediaTime() + 0.5
        basic.setValue(PasswordF.layer, forKey: "layer")
        PasswordF.layer.addAnimation(basic, forKey: nil)
        
        basic.beginTime = CACurrentMediaTime() + 0.7
        basic.setValue(PasswordF.layer, forKey: "layer")
        PasswordF.layer.addAnimation(basic, forKey: nil)
        
        
        //说明字符的动画
        let flyText = CABasicAnimation(keyPath: "position.x")
        flyText.repeatCount = 2.5
        flyText.speed = 2
        flyText.autoreverses = true
        flyText.duration = 4.0
        flyText.fromValue = info.layer.position.x + view.frame.size.width
        flyText.toValue?.addAnimation(flyText, forKey: "infoAppear")
        
        let fadLabelIn = CABasicAnimation(keyPath: "opacity")
        fadLabelIn.repeatCount = 2.5
        fadLabelIn.autoreverses = true
        fadLabelIn.speed = 2
        fadLabelIn.fromValue = 0.2
        fadLabelIn.toValue = 1.0
        fadLabelIn.duration = 4.0
        info.layer.addAnimation(fadLabelIn, forKey: "fadIn")
        
        //处理登录按钮
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 0.5
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.fromValue = 3.5
        scaleDown.toValue = 1

       let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = CGFloat(M_PI_4)
        rotate.toValue = 0
        
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0
        fade.toValue = 1
        
        groupAnimation.animations = [scaleDown,rotate,fade]
        LoginBtn.layer.addAnimation(groupAnimation, forKey: nil)

    }

 
    @IBAction func LoginBtnClick(sender: UIButton) {
        view.endEditing(true )
        let wobble = CAKeyframeAnimation(keyPath: "transform.rotation")
        wobble.duration = 0.25
        wobble.repeatCount = 4
        wobble.values = [0.0, -M_PI_4/4, 0.0, M_PI_4/4, 0.0]
        wobble.keyTimes = [0.0, 0.25,0.5, 0.75, 1.0]
        LoginLabel.layer.addAnimation(wobble, forKey: nil)
        
        
        
    }
   

}
























