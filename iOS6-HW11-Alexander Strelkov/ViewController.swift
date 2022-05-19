//
//  ViewController.swift
//  iOS6-HW11-Alexander Strelkov
//
//  Created by Alexandr Strelkov on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Elements
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar.jpg")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 64
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Александр Стрелков"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        label.textColor = UIColor(red: 225/255.0, green: 224/255.0, blue: 227/255.0, alpha: 1)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Установить статус"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var onlineStatus: UILabel = {
        let label = UILabel()
        label.text = "online"
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .lightGray
        return label
    }()
     
    private lazy var phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone")
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Редактировать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var storiesImage: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(
            pointSize: 15, weight: .light, scale: .small)
        imageView.image = UIImage(systemName: "camera", withConfiguration: config)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(
            pointSize: 15, weight: .light, scale: .small)
        imageView.image = UIImage(systemName: "square.and.pencil", withConfiguration: config)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postPhotoImage: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(
            pointSize: 15, weight: .light, scale: .small)
        imageView.image = UIImage(systemName: "photo", withConfiguration: config)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postVideoImage: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(
            pointSize: 15, weight: .light, scale: .small)
        imageView.image = UIImage(systemName: "video", withConfiguration: config)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var storiesImageLabel: UILabel = {
        let label = UILabel()
        label.text = "История"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Запись"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postPhotoImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Фото"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postVideoImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Клип"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var firstStackView = createHorizontalStackView()
    private lazy var secondStackView = createHorizontalStackView()
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var buttonLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
  
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(onlineStatus)
        view.addSubview(phoneImage)
        view.addSubview(editButton)
        view.addSubview(storiesImage)
        
        view.addSubview(parentStackView)
        
        parentStackView.addArrangedSubview(buttonLabelsStackView)
        
        buttonLabelsStackView.addArrangedSubview(firstStackView)
        firstStackView.addArrangedSubview(storiesImage)
        firstStackView.addArrangedSubview(postImage)
        firstStackView.addArrangedSubview(postPhotoImage)
        firstStackView.addArrangedSubview(postVideoImage)
        
        buttonLabelsStackView.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(storiesImageLabel)
        secondStackView.addArrangedSubview(postImageLabel)
        secondStackView.addArrangedSubview(postPhotoImageLabel)
        secondStackView.addArrangedSubview(postVideoImageLabel)
        
    }
    
    private func setupLayout() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            avatarImageView.heightAnchor.constraint(equalToConstant: 128),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: -30),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15)

        ])

        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            statusLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)

        ])

        onlineStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onlineStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            onlineStatus.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor, constant: 30)

        ])

        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImage.leadingAnchor.constraint(equalTo: onlineStatus.trailingAnchor, constant: 3),
            phoneImage.bottomAnchor.constraint(equalTo: onlineStatus.bottomAnchor)

        ])

        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            editButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

//            editButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            parentStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            parentStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 26/255.0, green: 25/255.0, blue: 27/255.0, alpha: 1)
    }
    
    //MARK: - Private functions
        
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
    
    //MARK: -Actions
    
    @objc private func buttonAction() {
        
    }
}

//MARK: - Constants

extension ViewController {
    
    enum Metric {
        static let buttonHeight: CGFloat = 75
        static let parentStackViewSpacing: CGFloat = 10
        static let informationStackViewSpacing: CGFloat = 15
        static let resultFontSize: CGFloat = 70
        static let buttonFontSize: CGFloat = 30
        
        static let leftOffset: CGFloat = 18
        static let rightOffset: CGFloat = -18
        static let bottomOffset: CGFloat = -50
    }
    
    enum Strings {
        
    }
}

