//
//  TblViewDelegate.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import Foundation
import UIKit

protocol TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath)
}
