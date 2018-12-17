//
//  JobRequestView.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit

protocol OnAcceptJobRequest: class {
    func onAcceptJobRequestButtonDidTouch(id: String?)
}

class JobRequestView: UIView {
    
    private let NIB_NAME = "JobRequestView"
    var id: String?
    
    weak var delegate: OnAcceptJobRequest?
    
    @IBOutlet weak var jobRequestCompanyName: UILabel!
    @IBOutlet weak var jobRequestDescription: UITextView!
    @IBOutlet weak var jobRequestAmountOffered: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBOutlet weak var jobRequestDropOffLocation: UILabel!
    @IBOutlet weak var jobRequestPickUpLocation: UILabel!
    @IBOutlet weak var jobRequestLoadDescription: UILabel!
    
    @IBAction func jobRequestAcceptButtonDidTouch(_ sender: Any) {
        delegate?.onAcceptJobRequestButtonDidTouch(id: id)
    }
    
    func setDelegate(delegate: OnAcceptJobRequest) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initContentView()
    }
    
    private func initContentView() {
        let bundle = Bundle.main
        let nib = UINib(nibName: NIB_NAME, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.clipsToBounds = true
        
        acceptButton.layer.cornerRadius = 5
        acceptButton.clipsToBounds = true
        
        view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        view.frame = bounds
        
        addSubview(view)
    }
    
    func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    

}
