//
//  MSHomePageViewController.swift
//  matchScore
//
//  Created by Triyakom PT on 4/8/16.
//  Copyright © 2016 Triyakom PT. All rights reserved.
//

import UIKit

class MSHomePageViewController: UIPageViewController, UIScrollViewDelegate {
    
    var controllers: NSMutableArray = []
    var page: Int = 0
    var pageControlUsed: Bool
    var rotating: Bool
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageScroll: UIPageControl!
    
    convenience init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
        // initialize controllers
        
        controllers = [MsInitialPageViewController(nibName: "MsInitialPageViewController", bundle: nil), MSFsPageViewController(nibName: "MSFsPageViewController", bundle: nil), MSScPageViewController(nibName: "MSScPageViewController", bundle: nil)]
        
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        // UIScrollViewSettings
        self.scrollView.pagingEnabled = true
        self.scrollView.scrollEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.delegate = self
        // UIPageControl settings
        self.pageScroll.enabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let viewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
        if viewController.view.superview != nil {
            viewController.viewDidAppear(animated)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        let viewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
        if viewController.view.superview != nil {
            viewController.viewWillDisappear(animated)
        }
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        let viewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
        if viewController.view.superview != nil {
            viewController.viewDidDisappear(animated)
        }
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for var i = 0; i < self.controllers.count; i++ {
            self.loadScrollViewWithPage(i)
        }
        self.pageScroll.currentPage = 0
        self.page = 0
        self.pageScroll.numberOfPages = self.controllers.count
        let viewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
        if viewController.view.superview != nil {
            viewController.viewWillAppear(animated)
        }
        self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * CGFloat(self.controllers.count), scrollView.frame.size.height)
    }
    
    func loadScrollViewWithPage(page: Int) {
        if page < 0 || page >= self.controllers.count {
            return
        }
        // replace the placeholder if necessary
        let controller: UIViewController = self.controllers[page] as! UIViewController
//        if let controller == nil {
//            return
//        }
        // add the controller's view to the scroll view
        if controller.view.superview == nil {
            var frame: CGRect = self.scrollView.frame
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0
            controller.view.frame = frame
            self.scrollView.addSubview(controller.view!)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let oldViewController: UIViewController = self.controllers[page] as! UIViewController
        let newViewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
        oldViewController.viewDidDisappear(true)
        newViewController.viewDidAppear(true)
        self.page = self.pageScroll.currentPage
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
            // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
            // which a scroll event generated from the user hitting the page control triggers updates from
            // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
            if pageControlUsed || rotating {
                // do nothing - the scroll was initiated from the page control, not the user dragging
                return
            }
            // Switch the indicator when more than 50% of the previous/next page is visible
            let pageWidth: CGFloat = self.scrollView.frame.size.width
        let page: Int = Int(floor((self.scrollView.contentOffset.x - pageWidth / CGFloat(2)) / pageWidth) + CGFloat(1))
            if self.pageScroll.currentPage != page {
                let oldViewController: UIViewController = self.controllers[self.pageScroll.currentPage] as! UIViewController
                let newViewController: UIViewController = self.controllers[page] as! UIViewController
                oldViewController.viewWillDisappear(true)
                newViewController.viewWillAppear(true)
                self.pageScroll.currentPage = page
                oldViewController.viewDidDisappear(true)
                newViewController.viewDidAppear(true)
                self.page = page
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
