//
//  SplitInputView.swift
//  tip-calculator
//
//  Created by ShinIl Heo on 3/11/24.
//

import UIKit

class SplitInputView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .brown
    }
}
