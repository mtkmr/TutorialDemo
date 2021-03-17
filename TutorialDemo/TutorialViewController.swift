//
//  ViewController.swift
//  TutorialDemo
//
//  Created by Masato Takamura on 2021/03/17.
//

import UIKit

class TutorialViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let pageLabelArray = ["1ページ目", "2ページ目", "3ページ目"]
    let backgroundColorArray: [UIColor] = [.systemRed, .systemBlue, .systemGreen]
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        //スクロールビューのコンテンツサイズ
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 3, height: scrollView.frame.size.height)
        
        var originX: CGFloat = 0
        let scrollViewSize = scrollView.frame.size
        
        for pageLabel in pageLabelArray {
            let pageView = CustomPageView(frame: CGRect(origin: CGPoint(x: originX, y: 0), size: CGSize(width: scrollViewSize.width, height: scrollViewSize.height)))
            pageView.pageNumberLabel.text = pageLabel
            
            pageView.backgroundColor = backgroundColorArray[i]
            i += 1
            scrollView.addSubview(pageView)
            originX += scrollViewSize.width
        }
        
    }
    
    
    @IBAction func finishTutorialButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let afterVC = storyboard.instantiateViewController(withIdentifier: "AfterViewController") as? AfterViewController {
            SceneDelegate.shared.window?.rootViewController = afterVC
        }
        
    }
    

}

//MARK: - UIScrollViewDelegate
extension TutorialViewController: UIScrollViewDelegate {
    
    ///scrollViewからコンテンツオフセットの変更を取得するデリゲートメソッド
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

