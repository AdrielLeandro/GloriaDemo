//
//  CellProtocol.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var identifier: String { get }
}

extension CellProtocol where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension CellProtocol where Self: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func dequeueReusableCell<T>(forIndexPath indexPath: IndexPath) -> T where T: CellProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}


extension UICollectionView {
    func dequeueReusableCell<T>(forIndexPath indexPath: IndexPath) -> T where T: CellProtocol {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}
