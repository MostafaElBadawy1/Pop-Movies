////
////  Routing.swift
////  Pop Movies
////
////  Created by mostafa  on 15/02/2023.
////
//
//import Foundation
//import UIKit
//protocol RoutingDestinationProtocol {}
//
//protocol RouterProtocol {
//    associatedtype RoutingDestination: RoutingDestinationProtocol
//    func route(to destination: RoutingDestination)
//}
//enum RoutingDestination: RoutingDestinationProtocol {
//    case movieDetails(movieId: Int)
//    case startNewChat
//    // etc.
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
//        case .startNewChat:
//            break
//            // navigate to the "start new chat" screen
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
//      case .startNewChat:
//          break
//      }
//   }
//    private func provideViewChatController(movieID: Int, resultHandler: ResultHandler) {
//        let viewModel = MovieDetailsViewModel(movieID: movieID)
//        let vc = MovieDetailsViewController(viewModel: viewModel)
//         resultHandler(.success(vc))
//      }
//   }
//
//protocol ViewControllerNavigator: class {
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
//final class ChatRouter: NavigationControllerRouterBase, RouterProtocol {
//
//   typealias RoutingDestination = RoutingDestination
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
