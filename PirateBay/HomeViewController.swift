//
//  HomeViewController.swift
//  PirateBay
//
//  Created by Cynthia Whitlatch on 2/18/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pageView: UIView!
    
    var pageViewController : UIPageViewController?
    var arrPageImage = ["piratebattle", "piratemap", "piratesofcaribbean"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setPageViewController()
    }
    
    private func setPageViewController() {
        let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "promoPageVC") as! UIPageViewController
        pageVC.dataSource = self
        
        let firstController = getViewController(atIndex: 0)
        
        pageVC.setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController = pageVC
        self.addChildViewController(self.pageViewController!)
        self.pageView.addSubview(self.pageViewController!.view)
        self.pageViewController?.didMove(toParentViewController: self)
        
    }
    
    fileprivate func getViewController(atIndex index: Int) -> PromoContentViewController {
        
        let promoContentVC = self.storyboard?.instantiateViewController(withIdentifier: "promoContentVC") as! PromoContentViewController
        
        promoContentVC.imageName = arrPageImage[index]
        promoContentVC.pageIndex = index
        
        return promoContentVC
        
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContentVC = viewController as! PromoContentViewController
        var index = pageContentVC.pageIndex
        
        if index == 0 || index == NSNotFound {
            return getViewController(atIndex: arrPageImage.count - 1)
        }
        
        index -= 1
        
        return getViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContentVC = viewController as! PromoContentViewController
        var index = pageContentVC.pageIndex
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == arrPageImage.count {
            return getViewController(atIndex: 0)
        }
        
        return getViewController(atIndex: index)
    }
}

