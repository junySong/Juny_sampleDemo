

//
//  SwiftViewController.swift
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/10/22.
//  Copyright © 2017年 Juny. All rights reserved.
//

import UIKit

class SwiftViewController: BasicViewController {

     let cirlce : CircleProgressView = CircleProgressView.init(frame: CGRect.init(x: 50, y: 150, width: 200, height: 200))
    
      let cirlce1 : CircleProgressView = CircleProgressView.init(frame: CGRect.init(x: 50, y: 370, width: 200, height: 200))
    
    
    func test1(){
        
        cirlce.setProgressAnimation(50, animation: true)
        cirlce1.setProgressAnimation(90, animation: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label: UILabel = UILabel.init(frame: CGRect.init(x: 50, y: 50, width: 200, height: 50))
        label.text = "swiftLabel"
        self.view.addSubview(label)
        
       
        self.view.addSubview(cirlce)
        cirlce.initViews()
        
      
        cirlce1.isGreen = false
        self.view.addSubview(cirlce1)
        
        cirlce1.initViews()
        self.perform(#selector(test1), with: nil, afterDelay: 3)
        
        
      
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
