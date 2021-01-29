//
//  CityDetailsViewController.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

class CityDetailsViewController: HiddenNavBarViewController {

    // MARK: - Private stored properties
    private let viewModel: CityDetailsViewModel
    private var mainView: CityDetailsView { view as! CityDetailsView }

    // MARK: - Internal methods
    init(viewModel: CityDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = CityDetailsView()
        configureView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.attach(delegate: self)
    }

    required init?(coder: NSCoder) { return nil }

    private func configureView() {
        mainView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension CityDetailsViewController: CityDetailsViewModelDelegate {
    func update(with viewData: CityDetailsViewData) {
        mainView.update(with: viewData)
    }
}
