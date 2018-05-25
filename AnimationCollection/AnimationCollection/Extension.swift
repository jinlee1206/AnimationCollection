//
//  Extension.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit


// Get a class name
public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}




// UITableView Register / Dequeue XIB

public extension UITableView {
    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    public func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}




// Instantiate a viewController in a storyboard
//public enum StoryboardInstantiateType {
//    case initial
//    case identifier(String)
//}
//
//public protocol StoryboardInstantiatable {
//    static var storyboardName: String { get }
//    static var storyboardBundle: Bundle { get }
//    static var instantiateType: StoryboardInstantiateType { get }
//}
//
//public extension StoryboardInstantiatable where Self: NSObject {
//    public static var storyboardName: String {
//        return className
//    }
//
//    public static var storyboardBundle: Bundle {
//        return Bundle(for: self)
//    }
//
//    private static var storyboard: UIStoryboard {
//        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
//    }
//
//    public static var instantiateType: StoryboardInstantiateType {
//        return .identifier(className)
//    }
//}
//
//public extension StoryboardInstantiatable where Self: UIViewController {
//    public static func instantiate() -> Self {
//        switch instantiateType {
//        case .initial:
//            return storyboard.instantiateInitialViewController() as! Self
//        case .identifier(let identifier):
//            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
//        }
//    }
//}



protocol InstantiableFromStoryboard {}

extension InstantiableFromStoryboard {
    static func fromStoryboard(name: String = "Main", bundle: Bundle? = nil) -> Self {
        let identifier = String(describing: self)
        guard let viewController = UIStoryboard(name: name, bundle: bundle).instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Cannot instantiate view controller of type " + identifier)
        }
        return viewController
    }
}

extension UIViewController: InstantiableFromStoryboard {}






