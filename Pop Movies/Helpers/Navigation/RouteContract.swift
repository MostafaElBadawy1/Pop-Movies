//
//  RouteContract.swift
//  Pop Movies
//
//  Created by mostafa  on 16/02/2023.
//

import Foundation
import UIKit

public protocol RouteContract {
  var destination: UIViewController { get }
  var style: RouteStyle { get }
}
