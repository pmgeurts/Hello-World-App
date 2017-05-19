//
//  ViewController.swift
//  Hello World App
//
//  Created by Paul Geurts on 17/05/2017.
//  Copyright © 2017 PG. All rights reserved.
//

import UIKit
import AVFoundation



enum lightBulb {
    case on
    case off
    
    mutating func toggle() -> UIImage {
        
        switch self {
        case .on:
            self = .off
            switchCameraTorch()
            return #imageLiteral(resourceName: "LightBulbOff")
        case .off:
            self = .on
            switchCameraTorch()
            return #imageLiteral(resourceName: "lightonblack")
        }
    }
    
    func switchCameraTorch() {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else {return}
        
        // check if the device has torch
        if (device.hasTorch) {
            do {
                // lock your device for configuration
                try device.lockForConfiguration()
                // check if your torchMode is on or off. If on turns it off otherwise turns it on
                if (device.torchMode == AVCaptureTorchMode.on) {
                    device.torchMode = AVCaptureTorchMode.off
                } else {
                    do {
                        // sets the torch intensity to 100%
                        try device.setTorchModeOnWithLevel(1.0)
                    } catch {
                        print(error)
                    }
                }
                // unlock your device
                device.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
    
}



class ViewController: UIViewController {
    
    
    var light: lightBulb = lightBulb.off
    var timer = Timer()
    
    //guard let avDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) else {return}
    
    
    
    @IBOutlet weak var theLightBulbImage: UIImageView!
    
    @IBAction func button(_ sender: Any) {
        toggleLight()
        
        
        
        
        
        
    }
    
    @IBAction func flashy(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(toggleLight), userInfo: nil, repeats: true)
    }
    
    func toggleLight() {
        theLightBulbImage.image = light.toggle()
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WWWAAAAAAAAAAAAAAAA")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        print("LoadView")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view Did Disappear")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

