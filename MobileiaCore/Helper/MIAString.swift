//
//  MIAString.swift
//  Cooperacion Seguros
//
//  Created by Matias Camiletti on 24/3/18.
//  Copyright © 2018 Cooperacion Seguros. All rights reserved.
//

import UIKit

public extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
