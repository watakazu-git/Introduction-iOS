//
//  ViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/04/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var quizJsonButton: UIButton! {
        didSet {
            quizJsonButton.isEnabled = true
        }
    }
    
    //スライドショー
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let images = [
        UIImage(named: "SelfIntroductionApp1"),
        UIImage(named: "SelfIntroductionApp2"),
        UIImage(named: "SelfIntroductionApp3"),
        UIImage(named: "SelfIntroductionApp4"),
        UIImage(named: "SelfIntroductionApp5")
    ]
    
    var currentIndex = 0
    
    //背景
    private var player = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        
        initAvplayer()
        self.player.play()
    }
    
    private func initAvplayer() {
        guard let path = Bundle.main.path(forResource: "Background", ofType: "mp4") else{ return }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill //縦横比を保ったままレイヤーサイズを満たす
        //playerLayer.repeatCount = 0
        //playerLayer.repeatCount = .infinity
        playerLayer.zPosition = -1 //最背面へ
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
            self.player.play()
        }
    }


}
//スライドショー(スクロール処理)
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        cell.image = images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
        pageControl.currentPage = currentIndex
    }
    
    
}
