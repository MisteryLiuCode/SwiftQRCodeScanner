//
//
//
//  ResultVC.swift
//  SwiftQRScanner_Example
//
//  Created by 刘帅彪 on 2022/11/16.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ResultVC: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var timeButton: UIButton!
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        //进入这个页面的同时删除上一个页面,保证一次回退到主页面
        var array = navigationController?.viewControllers ?? []
        array.remove(at: array.count - 2)
        self.navigationController?.setViewControllers(array, animated: true)
    }
    //播放音频
    func play(){
        let url = Bundle.main.url(forResource:"twoDays" , withExtension: "wav")
        do{
           player = try AVAudioPlayer(contentsOf: url!)
           player.play()
        }catch{
            print(error)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*Set up video in the background*/
            setUpVideo()
            play()
            for _ in 1...5000{
            }
            let time = timeUtils.getCurrentTime(timeFormat: .YYYYMMDDHHMMSS)
            timeButton.titleLabel?.text = time

    }
    
    func setUpVideo() {
        /*Get the path to the resource in the bundle*/
        let bundlePath = Bundle.main.path(forResource: "ResultVideo", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        /*Create a URL from it*/
        let url = URL(fileURLWithPath: bundlePath!)
        
        /*Create the video player item*/
        let item = AVPlayerItem(url: url)
        
        /*Create the player*/
        videoPlayer = AVPlayer(playerItem: item)
        
        /*Create the layer*/
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        /*Adjust the size and frame*/
//        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width * 1.5, y: 0, width: self.view.frame.size.width * 4, height: self.view.frame.size.height)
        
        videoPlayerLayer?.frame = videoView.bounds
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 1)
        
        /*Add it to the view and play it*/
        videoPlayer?.playImmediately(atRate: 0.3)
    }


}
