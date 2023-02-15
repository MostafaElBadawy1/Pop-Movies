//
//  Routing.swift
//  Pop Movies
//
//  Created by mostafa  on 15/02/2023.
//

import Foundation

protocol RoutingDestinationProtocol {}

protocol RouterProtocol {
   associatedtype RoutingDestination: RoutingDestinationProtocol
   func route(to destination: RoutingDestination)
}
