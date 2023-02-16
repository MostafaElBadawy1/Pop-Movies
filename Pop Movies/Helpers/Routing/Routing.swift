//
//  Routing.swift
//  Pop Movies
//
//  Created by mostafa  on 15/02/2023.
//

import Foundation
import UIKit
//protocol RoutingDestinationProtocol {}
//
//protocol RouterProtocol {
//    associatedtype RoutingDestination: RoutingDestinationProtocol
//    func route(to destination: RoutingDestination)
//}
//enum RoutingDestination: RoutingDestinationProtocol {
//    case movieDetails(movieId: Int)
//}
//class AppRouter: RouterProtocol {
//   // associatedtype RoutingDestination = RoutingDestination
//    static let shared = AppRouter()
//    func route(to destination: RoutingDestination) {
//        switch destination {
//        case .movieDetails(let movieId):
//            navigateToMovieDetails(movieId: movieId)
////            let viewModel = MovieDetailsViewModel(movieID: movieId )
////           let vc = MovieDetailsViewController(viewModel: viewModel)
////           self.navigationController?.pushViewController(vc, animated: true)
//
//        }
//    }
//}
//private func navigateToMovieDetails(movieId: Int) {
//    let viewModel = MovieDetailsViewModel(movieID: movieId)
//    let vc = MovieDetailsViewController(viewModel: viewModel)
//   AppNavigation.navigationController?.pushViewController(vc, animated: true)
//}
//
//
//
//protocol ViewControllerProvider {
//    typealias ResultHandler = (Result< UIViewController, Error>) -> Void
//   func provideViewController(resultHandler: @escaping ResultHandler)
//}
//
//extension RoutingDestination: ViewControllerProvider {
//   func provideViewController(resultHandler: @escaping ResultHandler) {
//      switch self {
//      case .movieDetails(let movieId):
//          self.provideViewChatController(movieID: movieId, resultHandler: resultHandler)
//      // etc.
//      }
//   }
//    private func provideViewChatController(movieID: Int, resultHandler: ResultHandler) {
//        let viewModel = MovieDetailsViewModel(movieID: movieID)
//        let vc = MovieDetailsViewController(viewModel: viewModel)
//         resultHandler(.success(vc))
//      }
//   }
//
//protocol ViewControllerNavigator: AnyObject {
//   func navigateTo(_ viewController: UIViewController)
//}
//extension RouterProtocol
//   where Self: ViewControllerNavigator, RoutingDestination: ViewControllerProvider {
//   func route(to destination: RoutingDestination) {
//      destination.provideViewController { [weak self] result in
//         if case .success(let viewController) = result {
//            self?.navigateTo(viewController)
//         }
//      }
//   }
//}
//class NavigationControllerRouterBase {}
//
//extension NavigationControllerRouterBase: ViewControllerNavigator {
//   func navigateTo(_ viewController: UIViewController) {
//   }
//
//}
//final class AppRouter: NavigationControllerRouterBase, RouterProtocol {
//
//   typealias AppRoutingDestination = RoutingDestination
//
//}
//class ModalPresentingRouterBase {}
//
//extension ModalPresentingRouterBase: ViewControllerNavigator {
//   func navigateTo(_ viewController: UIViewController) {
//   }
//}
//extension UIViewController {
//    func navigateTo(_ viewController: UIViewController) {
//        navigationController?.pushViewController(viewController, animated: false)
//    }
//}

//
//protocol RoutingDestinationProtocol {}
//
//protocol RouterProtocol {
//    associatedtype RoutingDestination: RoutingDestinationProtocol
//    func route(to destination: RoutingDestination)
//}
//
//
//enum ChatRoutingDestination: RoutingDestinationProtocol {
//    case viewChat(userId: Int)
//}
//
//class ChatRouter: RouterProtocol {
//    
//    typealias RoutingDestination = ChatRoutingDestination
//    
//    static let shared = ChatRouter()
//    
//    func route(to destination: RoutingDestination) {
//        switch destination {
//        case .viewChat(let userId):
//            self.viewChat(userId: userId)
//            //            let viewModel = MovieDetailsViewModel(movieID: userId)
//            //            let vc = MovieDetailsViewController(viewModel: viewModel)
//            //            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//    private func viewChat(userId: Int) {
//        let viewModel = MovieDetailsViewModel(movieID: userId)
//        let vc = MovieDetailsViewController(viewModel: viewModel)
//        let homeVC = HomeViewController()
//        homeVC.navigationController?.pushViewController(vc, animated: true)
//    }
//}
//
//protocol ViewControllerProvider {
//   typealias ResultHandler = (Result<UIViewController, Error>) -> Void
//   func provideViewController(resultHandler: @escaping ResultHandler)
//}
//
//
//extension ChatRoutingDestination: ViewControllerProvider {
//   func provideViewController(resultHandler: @escaping ResultHandler) {
//      switch self {
//      case .viewChat(let userId):
//         self.provideViewChatController(userId: userId, resultHandler: resultHandler)
//      // etc.
//      }
//   }
//  
//   private func provideViewChatController(userId: Int, resultHandler: ResultHandler) {
//      let viewChatController = ViewChatController(userId: userId)
//      resultHandler(.success(viewChatController))
//   }
//}
