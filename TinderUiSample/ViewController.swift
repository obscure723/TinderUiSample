//
//  ViewController.swift
//  TinderUiSample
//
//  Created by yonekan on 2018/09/24.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import Poi
import AudioToolbox

class ViewController: UIViewController, PoiViewDataSource, PoiViewDelegate {
    
    @IBOutlet weak var poiView: PoiView!
    
    var images = [
        UIImage(named: "animal01"),
        UIImage(named: "animal02"),
        UIImage(named: "animal03"),
        UIImage(named: "animal04"),
        UIImage(named: "animal05"),
        UIImage(named: "animal01"),
        UIImage(named: "animal02"),
        UIImage(named: "animal03"),
        UIImage(named: "animal04"),
        UIImage(named: "animal05"),
        UIImage(named: "animal01"),
        UIImage(named: "animal02"),
        UIImage(named: "animal03"),
        UIImage(named: "animal04"),
        UIImage(named: "animal05"),
        UIImage(named: "animal01"),
        UIImage(named: "animal02"),
        UIImage(named: "animal03"),
        UIImage(named: "animal04"),
        UIImage(named: "animal05"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        poiView.dataSource = self
        poiView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: PoiViewDataSource
    func numberOfCards(_ poi: PoiView) -> Int {
        return 20
    }
    
    func poi(_ poi: PoiView, viewForCardAt index: Int) -> UIView {
        
        let image = images[index]
        let imageView = UIImageView(image: image!)
        imageView.backgroundColor = UIColor.yellow
        return imageView
        
    }
    
    func poi(_ poi: PoiView, viewForCardOverlayFor direction: SwipeDirection) -> UIImageView? {
        switch direction {
        case .right:
            return UIImageView(image: UIImage(named: "good"))
        case .left:
            return UIImageView(image: UIImage(named: "bad"))
        }
    }
    
    // MARK: PoiViewDelegate
    func poi(_ poi: PoiView, didSwipeCardAt: Int, in direction: SwipeDirection) {
        
        switch direction {
        case .left:
            print("left")
        case .right:
            print("right")
        }
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
        print("last")
    }
    
    // MARK: IBAction
    @IBAction func OKAction(_ sender: UIButton) {
        poiView.swipeCurrentCard(to: .right)
    }
    
    @IBAction func BadAction(_ sender: UIButton) {
        poiView.swipeCurrentCard(to: .left)
    }
    
    @IBAction func undo(_ sender: UIButton) {
        poiView.undo()
    }

}

