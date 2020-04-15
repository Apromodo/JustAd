//
//  ViewController.swift
//  GoogleAdModTest
//
//  Created by kaya unal on 10.04.2020.
//  Copyright © 2020 kaya unal. All rights reserved.
//

import UIKit
import GoogleMobileAds
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var interstitial: GADInterstitial!
    var sayi1 = 1

    var bannerView: GADBannerView!

    override func viewDidLoad() {
      super.viewDidLoad()
      
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
      // In this case, we instantiate the banner with desired ad size.
      bannerView = GADBannerView(adSize: kGADAdSizeBanner)

      addBannerViewToView(bannerView)
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
      view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: bottomLayoutGuide,
                            attribute: .top,
                            multiplier: 1,
                            constant: 0),
         NSLayoutConstraint(item: bannerView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0)
        ])
            interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        
    }

    @IBAction func nextClicked(_ sender: Any) {
        

        
        
        
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
            numberLabel.text = "\(sayi1)"
            var son = sayi1 += 1
            print(son)
            
        }
//                let appDelagate = UIApplication.shared.delegate as! AppDelegate
//                let context = appDelagate.persistentContainer.viewContext
//                let newSayi = NSEntityDescription.insertNewObject(forEntityName: "Toplam", into: context)
//                
//                
//        //        atributes
//                
//        newSayi.setValue(numberLabel.text, forKey: "sayi")
//        
//        do {
//            try context.save()
//            
//        } catch {
//            print("error")
//        }
        
        
        
    }
    
}

