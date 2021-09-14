//
//  Demo_1Tests.swift
//  Demo_1Tests
//
//  Created by Dmytro Kovryhin on 01.09.2021.
//

import XCTest
@testable import Demo_1

class Demo_1Tests: XCTestCase {
    
    func testExample_1() throws {
        let view = BasicView()
        view.titleLabel.text = "Hello, world!"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_1.jpg") })
    }
    
    func testExample_2() throws {
        let view = BasicView()
        view.titleLabel.text = "Hello, world! Let's try a longer line here!"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_2.jpg") })
    }
    
    func testExample_3() throws {
        let view = BasicView()
        view.titleLabel.text = "Hello, world! Let's try a longer line here! Like thiiiiiiis long!"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_3.jpg") })
    }
    
    func testExample_4() throws {
        let view = TextWithTitle()
        view.titleLabel.text = "Hello, world!"
        view.subtitleLabel.text = "Basic subtitle text"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_1.jpg") })
    }
    
    func testExample_5() throws {
        let view = TextWithTitle()
        view.titleLabel.text = "Hello, world! Let's try a longer line here!"
        view.subtitleLabel.text = "Longer subtitle text, let's see how it fits"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_2.jpg") })
    }
    
    func testExample_6() throws {
        let view = TextWithDescription()
        view.titleLabel.text = "Hello, world! Let's try a longer line here!"
        view.subtitleLabel.text = "Longer subtitle text, let's see how it fits. Indeed let's make it even longer"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_3.jpg") })
    }
    
    func testExample_7() throws {
        let view = TextWithDescription()
        view.titleLabel.text = "Hello, world!"
        view.subtitleLabel.text = "Basic subtitle text"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_1.jpg") })
    }
    
    func testExample_8() throws {
        let view = TextWithDescription()
        view.titleLabel.text = "Hello, world! Let's try a longer line here!"
        view.subtitleLabel.text = "Longer subtitle text, let's see how it fits"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_2.jpg") })
    }
    
    func testExample_9() throws {
        let view = TextWithTitle()
        view.titleLabel.text = "Hello, world! Let's try a longer line here!"
        view.subtitleLabel.text = "Longer subtitle text, let's see how it fits. Indeed let's make it even longer"
        ScreenSize.allCases.forEach({ render(view: view, for: $0, andSaveTo: "\(type(of: view))_\($0.screenSize())_3.jpg") })
    }
}

enum ScreenSize: CaseIterable {
    case iPhone8
    case iPhone8Plus
    case iPhone12mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhoneSE
    case iPhoneSE2
    
    func screenSize() -> CGSize {
        //Based on https://www.ios-resolution.com
        switch self {
        case .iPhone8:
            return .init(width: 375, height: 667)
        case .iPhone8Plus:
            return .init(width: 414, height: 736)
        case .iPhone12mini:
            return .init(width: 375, height: 812)
        case .iPhone12:
            return .init(width: 390, height: 844)
        case .iPhone12Pro:
            return .init(width: 390, height: 844)
        case .iPhone12ProMax:
            return .init(width: 428, height: 926)
        case .iPhoneSE:
            return .init(width: 320, height: 568)
        case .iPhoneSE2:
            return .init(width: 375, height: 667)
        }
    }
}

extension Demo_1Tests {
    
    func render(view: UIView, for screen:ScreenSize, andSaveTo filename: String) {
        let containerView = layout(view: view, for: screen)
        save(view: containerView, to: filename)
    }
    
    func layout(view: UIView, for screen:ScreenSize) -> UIView {
        let size = screen.screenSize()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: size.height),
            containerView.widthAnchor.constraint(equalToConstant: size.width)
        ])
        containerView.layoutIfNeeded()
        return containerView
    }
    
    func save(view: UIView, to filename: String) {
        let snapshot = view.asImage()
        let directoryPath = NSTemporaryDirectory()
        if !FileManager.default.fileExists(atPath: directoryPath) {
            try? FileManager.default.createDirectory(atPath: directoryPath, withIntermediateDirectories: false, attributes: nil)
        }
        let tmpPath = "\(directoryPath)\(filename)"
        let imgData = snapshot.jpegData(compressionQuality: 1.0)!
        try! imgData.write(to: URL(fileURLWithPath: tmpPath))
    }
}
