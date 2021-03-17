//
//  FirstPageView.swift
//  TutorialDemo
//
//  Created by Masato Takamura on 2021/03/17.
//

import UIKit

class CustomPageView: UIView {
    
    
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

}
