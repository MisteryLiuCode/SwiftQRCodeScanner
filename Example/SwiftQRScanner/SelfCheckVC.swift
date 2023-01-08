//
//  SelfCheckVC.swift
//  SwiftQRScanner_Example
//
//  Created by 刘帅彪 on 2022/11/30.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class SelfCheckVC: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    @IBOutlet weak var topDayButton: UIButton!
    @IBOutlet weak var topTimeButton: UIButton!
    @IBOutlet weak var buttomTimeButton1: UIButton!
    @IBOutlet weak var buttomTimeButton2: UIButton!
    @IBOutlet weak var videoView: UIView!
    
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //播放时间
            setUpVideo()
        //设置顶部日期
        let topDay = timeUtils.getCurrentTime(timeFormat: .YYYYMMDD)
        topDayButton.titleLabel?.text = topDay
        //顶部时间
        let topTime = timeUtils.getCurrentTime(timeFormat: .HHMMSS)
        topTimeButton.titleLabel?.text = topTime
        //底部时间
        let bottTime1 = timeUtils.getCurrentTime(timeFormat: .MMDDHHSS)
        buttomTimeButton1.titleLabel?.text = bottTime1
        //底部时间
        let bottTime2 = timeUtils.getCurrentTime(timeFormat: .MMDD)
        buttomTimeButton2.titleLabel?.text = bottTime2+" 24:00"
    }
    

    func setUpVideo() {
        //视频资源
        let bundlePath = Bundle.main.path(forResource: "SelfCheck", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        /*Create the video player item*/
        let item = AVPlayerItem(url: url)
        
        /*Create the player*/
        videoPlayer = AVPlayer(playerItem: item)
        
        /*Create the layer*/
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        /*Adjust the size and frame*/
//        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width * 1.5, y: 0, width: self.view.frame.size.width * 4, height: self.view.frame.size.height)
        //在videoView中播放
        videoPlayerLayer?.frame = videoView.bounds
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 1)
        
        /*Add it to the view and play it*/
        videoPlayer?.playImmediately(atRate: 0.8)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
