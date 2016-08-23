//
//  StickerViewController.swift
//  CustomStickerExtension
//
//  Created by Basheer Ahamed on 10/8/16.
//  Copyright © 2016 Basheer Ahamed. All rights reserved.
//

import Messages

class StickerViewController : MSStickerBrowserViewController {
    var stickerArray = [MSSticker]()
    
    override func viewDidLoad() {
        loadStickers()
        
    }
    
    func loadStickers () {
        for i in 1...7  {
            let imageName = "sticker\(i)"
            let path = Bundle.main.path(forResource: imageName, ofType: "jpg")             
            let sticker: MSSticker
            do {
                let url = URL(fileURLWithPath: path!)
                try sticker = MSSticker(contentsOfFileURL: url, localizedDescription: "Hello")
                stickerArray.append(sticker)
            } catch {
                print(error)
                return
            }
        }
        stickerBrowserView.reloadData()
    }

    override var stickerSize: MSStickerSize {
        get {
            return .small
        }
    }
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickerArray.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView,
                            stickerAt index: Int) -> MSSticker {
        return stickerArray[index]
    }
    
    
}
