//
//  Constants.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

struct Constants {
    private init() {}
    // MARK: UI constants -
    struct UI {
        private init() {}
        
        struct ImagesNames {
            private init() {}
            
            static let logo = "dreammirror_logo"
        }
        
        struct FontsNames {
            private init() {}
            
            static let general: String = "KohinoorDevanagari-Regular"
            static let medium: String = "KohinoorDevanagari-Medium"
            static let semibold: String = "KohinoorDevanagari-Semibold"
        }
        
        struct Colors {
            private init() {}
            
            static let primary: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let secondary: UIColor = #colorLiteral(red: 0.9698011279, green: 0.2449444234, blue: 0.1140630171, alpha: 1)
            static let shapes: UIColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
            static let secondaryShapes: UIColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.6)
        }
    }
    // MARK: Network constants -
    struct Network {
        private init() {}
        
        static let baseYoutubeUrl = ""
    }
}
