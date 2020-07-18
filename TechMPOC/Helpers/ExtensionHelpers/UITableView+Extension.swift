//
//  UITableView+Extension.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

extension UITableView {

    func hideEmptyRows(RemoveSeperator isSeperatorRemove: Bool = false) {

        if isSeperatorRemove {

            self.separatorColor = self.backgroundColor ?? UIColor.white
            self.separatorStyle = .none
        }
        self.tableFooterView = UIView()
    }

}
