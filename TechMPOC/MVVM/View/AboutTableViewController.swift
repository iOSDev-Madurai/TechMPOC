//
//  AboutTableViewController.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    // Properties

    private lazy var viewModel: AboutViewModel = {
        return AboutViewModel()
    }()

    private var details: About? {
        didSet {
            self.navigationItem.title = details?.title
            tableView.reloadData()
        }
    }

    // MARK:- ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(AboutTableViewCell.self, forCellReuseIdentifier: CellIdentifier.about)

        setNavigationDetails()

        refreshView()
    }

    // MARK:- API Data
    
    private func refreshView() {

        viewModel.getDetailsOfFacts { [weak self] (about) in
            guard let strongSelf = self else { return }
            strongSelf.details = about
        }
    }
    
    // MARK:- Navigation

    private func setNavigationDetails() {

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshBarButtonTouched(_:)))
        self.navigationItem.title = NavigtionConstants.Title.updating
    }

    @objc private func refreshBarButtonTouched(_ sender: UIBarButtonItem) {

        refreshView()
    }

    // MARK: - Table view data source & Delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard var details = details else { return 0 }
        return details.aboutRows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            var details = details,
            let row = details.aboutRows[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.about, for: indexPath) as? AboutTableViewCell
            else {
                return UITableViewCell()
        }
        cell.titleLabel.text = row.title
        cell.descriptionLabel.text = row.rowDescription ?? " - "
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

}
