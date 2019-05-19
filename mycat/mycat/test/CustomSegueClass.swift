//
//  CustomSegueClass.swift
//  mycat
//
//  Created by MOONJUNG on 17/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit

class CustomSegueClass: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
                        src.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width/3, y: 0)
        },
                       completion: { finished in
                        src.present(dst, animated: true, completion: nil)
        }
        )
    }

}
