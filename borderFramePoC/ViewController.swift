//
//  ViewController.swift
//  borderFramePOC
//
//  Created by 서채희 on 6/16/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var innerBorderView = makeView()
    private lazy var centerBorderView = makeView()
    private lazy var outerBorderView = makeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Initial Setting
    /**
     set UI elements
     */
    func setupUI() {
        makeGrid()
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 60
        stackView.axis = .vertical
        stackView.addArrangedSubview(innerBorderView)
        stackView.addArrangedSubview(centerBorderView)
        stackView.addArrangedSubview(outerBorderView)
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            innerBorderView.heightAnchor.constraint(equalToConstant: 100),
            innerBorderView.widthAnchor.constraint(equalToConstant: 100),
            centerBorderView.heightAnchor.constraint(equalToConstant: 100),
            centerBorderView.widthAnchor.constraint(equalToConstant: 100),
            outerBorderView.heightAnchor.constraint(equalToConstant: 100),
            outerBorderView.widthAnchor.constraint(equalToConstant: 100)
        ])
        self.view.layoutIfNeeded()
        
        innerBorderView.setBorder(borderWidth: 10, borderColor: UIColor.red.withAlphaComponent(0.5).cgColor, cornerRadius: 15, type: .inside)
        centerBorderView.setBorder(borderWidth: 10, borderColor: UIColor.red.withAlphaComponent(0.5).cgColor, cornerRadius: 15, type: .center)
        outerBorderView.setBorder(borderWidth: 10, borderColor: UIColor.red.withAlphaComponent(0.5).cgColor, cornerRadius: 15, type: .outside)
    }
}

extension ViewController {
    /**
     Make gridlines whose spacings are 10
     */
    private func makeGrid() {
        var curX = 9.0
        while curX < self.view.frame.maxX {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemGray4
            self.view.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: curX),
                view.topAnchor.constraint(equalTo: self.view.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                view.widthAnchor.constraint(equalToConstant: 1)
            ])
            curX += 10
        }
        
        var curY = 9.0
        while curY < self.view.frame.maxY {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemGray4
            self.view.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: curY),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 1)
            ])
            curY += 10
        }
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }
}
