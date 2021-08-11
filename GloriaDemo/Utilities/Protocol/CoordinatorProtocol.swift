//
//  CoordinatorProtocol.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    func start()
    func toNext()
    func close()
}
