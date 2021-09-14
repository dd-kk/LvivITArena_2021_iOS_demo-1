//
//  UIView+UIImage.swift
//  Demo_1
//
//  Created by Dmytro Kovryhin on 10.09.2021.
//

import UIKit

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
