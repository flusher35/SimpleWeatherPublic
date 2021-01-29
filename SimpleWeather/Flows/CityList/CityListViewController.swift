//
//  CityListViewController.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

class CityListViewController: HiddenNavBarViewController {

    // MARK: - Private stored properties
    private let viewModel: CityListViewModel
    private var mainView: CityListView { view as! CityListView }

    // MARK: - Internal methods
    init(viewModel: CityListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = CityListView()
        setupTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateList()
    }

    required init?(coder: NSCoder) { return nil }

    // MARK: - Private methods
    private func setupTableView() {
        mainView.tableView.register(cell: CityListCell.self)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension CityListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellTapped(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? Transformable
        cell?.transform(true)
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? Transformable
        cell?.transform(false)
    }
}

extension CityListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityListCell = tableView.dequeueReusableCell(for: indexPath)
        if let cellViewModel = viewModel.getCellViewModel(for: indexPath.row) {
            cellViewModel.getViewData { [weak tableView] viewData in
                DispatchQueue.main.async {
                    (tableView?.cellForRow(at: indexPath) as? CityListCell)?.configure(with: viewData)
                }
            }
            cell.configure(cityName: cellViewModel.cityName, isLoading: cellViewModel.isLoading)
        }
        return cell
    }
}
