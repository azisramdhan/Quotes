//
//  QuoteDetailViewController.swift
//  QuotesModules
//
//  Created by Azis Ramdhan on 25/05/25.
//

import QuotesCore
#if canImport(UIKit)
import UIKit

class QuoteDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let quote: Quote
    
    // MARK: - UI Elements
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let quoteLabel = UILabel()
    private let authorLabel = UILabel()
    private let shareButton = UIButton(type: .system)
    
    // MARK: - Initialization
    init(quote: Quote) {
        self.quote = quote
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        configureUI()
        layoutUI()
        setQuoteData()
    }
    
    // MARK: - Setup
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Quote"
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureUI() {
        quoteLabel.numberOfLines = 0
        quoteLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        quoteLabel.textColor = .label
        quoteLabel.textAlignment = .center
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        authorLabel.textColor = .secondaryLabel
        authorLabel.textAlignment = .center
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        shareButton.setTitle("Share Quote", for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        shareButton.backgroundColor = .systemBlue
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.layer.cornerRadius = 10
        shareButton.addTarget(self, action: #selector(shareQuote), for: .touchUpInside)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(quoteLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(shareButton)
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            quoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            shareButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 40),
            shareButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 200),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
    
    private func setQuoteData() {
        quoteLabel.text = "\"\(quote.text)\""
        authorLabel.text = "— \(quote.author)"
    }
    
    // MARK: - Actions
    @objc private func shareQuote() {
        let quoteText = "\"\(quote.text)\" — \(quote.author)"
        let activityViewController = UIActivityViewController(activityItems: [quoteText], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}
#endif
