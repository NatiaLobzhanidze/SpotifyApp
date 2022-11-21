//
//  Coordinator.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 16.11.22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set}
    
    init(navigationController: UINavigationController)
}




