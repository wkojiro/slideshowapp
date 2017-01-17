//
//  ViewController.swift
//  SlideshowApp02
//
//  Created by Kojiro Wakabayashi on 2017/01/13.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topimageView: UIImageView!

    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!

    @IBOutlet weak var gobutton: UIButton!
    
    @IBOutlet var tapgesture: UITapGestureRecognizer!
    //デフォルト値
    
    
    let capimages = ["cap01.jpg","cap02.jpg","cap03.jpg"]
    let trumpimages = ["trump1.jpg","trump2.jpg","trump3.jpg"]
    
 //   let myScaleDownView: UIImageView = UIImageView()
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    var returncount: Int? = nil
    
    var count = 0
    
    var playvalue:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像を設定する.
        
        playbutton.isEnabled = true
        
        
        let imageWidth: CGFloat = 650
        let imageHeight: CGFloat = 400
        
        
        // 画像を縮小する(0.5倍)
        // 表示する座標を設定.
        let downPosX: CGFloat = (self.view.bounds.width - imageWidth) / 2
        let downPosY: CGFloat = 50
        
        // 表示用のUIImageViewを生成.
         //       let myScaleDownView: UIImageView = UIImageView(frame:  CGRect(x: downPosX, y: downPosY, width: imageWidth, height: imageHeight))
        
        // 表示用のUIImageViewを生成.
        topimageView.frame =  CGRect(x: downPosX, y: downPosY, width: imageWidth, height: imageHeight)
        
       
        // タイマーを設定
     //   timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        // 一定間隔でiの値を０、１、２に書き換える
        
        let myImage: UIImage = UIImage(named: trumpimages[count])!
        

        
        // UIImageViewに画像を設定する.
        topimageView.image = myImage
        
        // 縮小用(0.5倍)のアフィン行列を生成する.
        topimageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        // Viewに追加する.
        
        self.view.addSubview(topimageView)
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // でーたそうしんするためのもの
        // 送信先の情報を取得する
        let detailViewController:DetailViewController = segue.destination as! DetailViewController
        // 繊維先のResultで宣言している値に代入して渡す
        
        detailViewController.count = count
        
        //戻ってきた時のためにcount値を用意しておく（このcount値の画像から再スタートできるように）
        returncount = count
        
   //     if timer.isValid == true {
            
   //         timer.invalidate()
            
   //     }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    func update(tm: Timer) {
 
        /*
        if returncount != nil {
        
          count = returncount!
        // 関数が呼ばれていることを確認
        if count == 0 {
            count = 1
        } else if count == 1 {
            count = 2
        } else if count == 2 {
            count = 0
        }
        
        topimageView.image = UIImage(named: trumpimages[count])
            
        } else if returncount == nil {
        */
            if count == 0 {
                count = 1
            } else if count == 1 {
                count = 2
            } else if count == 2 {
                count = 0
            }
            
        topimageView.image = UIImage(named: trumpimages[count])
  
            
       // }
    }


/* 写真をタップしたらタイマーを切るという実装をしたが上手く動かない。
    func tapgesture(gestureRecognizer: UITapGestureRecognizer){
        print("hello")
        if timer.isValid == true {
            
            timer.invalidate()
        
        }
    }
*/
    
    @IBAction func playbutton(_ sender: Any) {
        
    //   let img = UIImage(named:"cap01.jpg")
    //    topimageView.image = img
        if playvalue == true{
        playbutton.setTitle("停止", for: .normal)
            
        gobutton.isEnabled = false
        backbutton.isEnabled = false
            
        playvalue = false
         
            
        if returncount != nil {
                
              count = returncount!
        }
        // タイマーを設定
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            
            
            
        } else if playvalue == false {
            
            if timer.isValid == true {
                
                //timerを破棄する.
                timer.invalidate()
            
            
        playbutton.setTitle("再生", for: .normal)
        gobutton.isEnabled = true
        backbutton.isEnabled = true
                
        playvalue = true
            
                
                
            }
            
            
        }
        
        
    }
    
    @IBAction func gobutton(_ sender: Any) {
        
        if count == 0 {
            count = 1
        } else if count == 1 {
            count = 2
        } else if count == 2 {
            count = 0
        }
        
        topimageView.image = UIImage(named: trumpimages[count])
        
    }
    
    @IBAction func backbutton(_ sender: Any) {
        
        if count == 0 {
            count = 2
        } else if count == 1 {
            count = 0
        } else if count == 2 {
            count = 1
        }
        
        topimageView.image = UIImage(named: trumpimages[count])
        
        
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
        // 詳細画面からの戻りで値があれば
        //if returncount != nil{
       count = returncount!
        //}
        print(count)
        print("hello")
/*        if count == 0 {
            count = 2
        } else if count == 1 {
            count = 0
        } else if count == 2 {
            count = 1
        }
*/        
       topimageView.image = UIImage(named: trumpimages[count])
    }


}

