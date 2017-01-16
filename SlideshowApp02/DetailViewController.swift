//
//  DetailViewController.swift
//  SlideshowApp02
//
//  Created by Kojiro Wakabayashi on 2017/01/16.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bigimage: UIImageView!
    let trumpimages = ["trump1.jpg","trump2.jpg","trump3.jpg"]
    
    let myBigView: UIImageView = UIImageView()
    
    
    
    var count = 0
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print(count)
        // Do any additional setup after loading the view.
        let image_count = count
        
        let myImage: UIImage = UIImage(named: trumpimages[image_count])!
        
        // UIImageViewに画像を設定する.
        bigimage.image = myImage
        
        // (0.8倍)のアフィン行列を生成する.
        //myBigView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        // Viewに追加する.
    
        self.view.addSubview(bigimage)
    
        
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
