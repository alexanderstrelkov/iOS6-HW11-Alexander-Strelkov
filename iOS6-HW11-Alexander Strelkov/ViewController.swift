//
//  ViewController.swift
//  iOS6-HW11-Alexander Strelkov
//
//  Created by Alexandr Strelkov on 18.05.2022.
// VK app v.1.0 build for iPhone 12 Pro Max

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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: Metric.labelFontSize)
        label.textColor = UIColor(red: 225/255.0, green: 224/255.0, blue: 227/255.0, alpha: 1)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Установить статус"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var onlineStatus: UILabel = {
        let label = UILabel()
        label.text = "online"
        label.font = UIFont(name: "HelveticaNeue", size: Metric.onlineStatusFontSize)
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
        button.titleLabel?.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var storiesImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .thin)
        imageView.image = UIImage(systemName: "camera", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .thin)
        imageView.image = UIImage(systemName: "square.and.pencil", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postPhotoImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .thin)
        imageView.image = UIImage(systemName: "photo", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var postVideoImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .thin)
        imageView.image = UIImage(systemName: "video", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var storiesImageLabel: UILabel = {
        let label = UILabel()
        label.text = "История"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Запись"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postPhotoImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Фото"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var postVideoImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Клип"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 128/255.0, green: 162/255.0, blue: 208/255.0, alpha: 1)
        return label
    }()
    
    private lazy var firstStackView = createHorizontalStackView()
    private lazy var secondStackView = createHorizontalStackView()
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var buttonLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.buttonLabelsStackViewSpacing
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var homeImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .thin)
        imageView.image = UIImage(systemName: "house", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 131/255.0, green: 131/255.0, blue: 132/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var wavesImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .light)
        imageView.image = UIImage(systemName: "dot.radiowaves.up.forward", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 131/255.0, green: 131/255.0, blue: 132/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var caseImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .light)
        imageView.image = UIImage(systemName: "briefcase", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 130/255.0, green: 166/255.0, blue: 220/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var snowFlakeImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .light)
        imageView.image = UIImage(systemName: "snowflake", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 142/255.0, green: 127/255.0, blue: 237/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var infoImage: UIImageView = {
        let imageView = UIImageView()
        let thinConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .light)
        imageView.image = UIImage(systemName: "info.circle.fill", withConfiguration: thinConfiguration)
        imageView.tintColor = UIColor(red: 225/255.0, green: 226/255.0, blue: 228/255.0, alpha: 1)
        return imageView
    }()
    
    private lazy var imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Город: Москва"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 131/255.0, green: 131/255.0, blue: 132/255.0, alpha: 1)
        return label
    }()
    
    private lazy var subscribersLabel: UILabel = {
        let label = UILabel()
        label.text = "35 подписчиков"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 131/255.0, green: 131/255.0, blue: 132/255.0, alpha: 1)
        return label
    }()
    
    private lazy var workPlaceLabel: UILabel = {
        let label = UILabel()
        label.text = "Указать место работы"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 130/255.0, green: 166/255.0, blue: 220/255.0, alpha: 1)
        return label
    }()
    
    private lazy var getPresentLabel: UILabel = {
        let label = UILabel()
        label.text = "Получить подарок >"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 142/255.0, green: 127/255.0, blue: 237/255.0, alpha: 1)
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Подробная информация"
        label.font = .systemFont(ofSize: Metric.labelFontSize, weight: .medium)
        label.textColor = UIColor(red: 225/255.0, green: 226/255.0, blue: 228/255.0, alpha: 1)
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 31
        stackView.distribution = .fillEqually
        
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
        
        view.addSubview(imagesStackView)
        imagesStackView.addArrangedSubview(homeImage)
        imagesStackView.addArrangedSubview(wavesImage)
        imagesStackView.addArrangedSubview(caseImage)
        imagesStackView.addArrangedSubview(snowFlakeImage)
        imagesStackView.addArrangedSubview(infoImage)
        
        view.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(cityLabel)
        labelsStackView.addArrangedSubview(subscribersLabel)
        labelsStackView.addArrangedSubview(workPlaceLabel)
        labelsStackView.addArrangedSubview(getPresentLabel)
        labelsStackView.addArrangedSubview(informationLabel)
    }
    
    private func setupLayout() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            avatarImageView.heightAnchor.constraint(equalToConstant: 128),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
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
            editButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Metric.leftOffset),
            editButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            parentStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            parentStackView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
        imagesStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagesStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset),
            imagesStackView.topAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: 45)
            
        ])
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor.constraint(equalTo: imagesStackView.leadingAnchor, constant: 60),
            labelsStackView.topAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: 53)
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
    
    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }
    
    //MARK: -Actions
    
    @objc private func buttonAction() {
        
    }
}

//MARK: - Constants

extension ViewController {
    
    enum Metric {

        static let parentStackViewSpacing: CGFloat = 10
        static let labelsStackViewSpacing: CGFloat = 10
        static let buttonLabelsStackViewSpacing: CGFloat = 10
        static let imagesStackViewSpacing: CGFloat = 15
        static let labelFontSize: CGFloat = 17
        static let onlineStatusFontSize: CGFloat = 15
        
        static let leftOffset: CGFloat = 10
        static let rightOffset: CGFloat = -18
        static let bottomOffset: CGFloat = -50
    }
    
    enum Strings {
        
    }
}

