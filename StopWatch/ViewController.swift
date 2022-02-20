//
//  ViewController.swift
//  StopWatch
//
//  Created by SeinaKonishi on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0

    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        
        if count > 9.8 && count < 10.2 {
            hanteiLabel.text = "PERFECT"
        }else if count > 9.7 && count < 10.3{
            hanteiLabel.text = "GREAT"
        }else if count > 9.5 && count < 10.5{
            hanteiLabel.text = "GOOD"
        }else{
            hanteiLabel.text = "BAD"
        }
    }
    
    
    @IBAction func start(){
        
        hanteiLabel.text = ""
        
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func stop(){
        
        if timer.isValid{
            timer.invalidate()
            
            self.hantei()
            
        }
        
    }
    
    @IBAction func reset(){
        
        count = 0.0
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = ""
        
        if timer.isValid{
            timer.invalidate()
        
        }
        
    }


}

