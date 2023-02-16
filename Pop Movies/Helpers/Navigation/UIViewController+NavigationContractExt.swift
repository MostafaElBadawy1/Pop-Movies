//
//  UIViewController+NavigationContractExt.swift
//  Pop Movies
//
//  Created by mostafa  on 16/02/2023.
//

import Foundation
import UIKit
extension UIViewController: NavigationContract {
  public func navigate(to router: RouteContract) {
    navigate(to: router.destination, with: router.style)
  }

  public func navigate(to viewController: UIViewController, with style: RouteStyle) {
    switch style {
    case .push:
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
