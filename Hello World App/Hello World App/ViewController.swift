//
//  ViewController.swift
//  Hello World App
//
//  Created by Paul Geurts on 17/05/2017.
//  Copyright © 2017 PG. All rights reserved.
//

import UIKit



    var switchy: Bool = false
    
    class ViewController: UIViewController {

        
        @IBOutlet weak var theLightBulbImage: UIImageView!
        
        @IBAction func button(_ sender: Any) {
            if switchy == false {
                theLightBulbImage.image = #imageLiteral(resourceName: "lightonblack")
                switchy = true
            } else {
                theLightBulbImage.image = #imageLiteral(resourceName: "LightBulbOff")
                switchy = false
                
            }
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

