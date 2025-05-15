// QuoteCell.swift
import UIKit

class QuoteCell: UICollectionViewCell {
    static let reuseID = "QuoteCell"
    
    // MARK: - UI Elements
    private let containerView = UIView()
    private let quoteLabel = UILabel()
    private let authorLabel = UILabel()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configure() {
        addSubviews()
        configureContainerView()
        configureQuoteLabel()
        configureAuthorLabel()
        setConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(quoteLabel)
        containerView.addSubview(authorLabel)
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureQuoteLabel() {
        quoteLabel.numberOfLines = 0
        quoteLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        quoteLabel.textColor = .label
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureAuthorLabel() {
        authorLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        authorLabel.textColor = .secondaryLabel
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            quoteLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            quoteLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            quoteLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 8),
            authorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            authorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Public Methods
    func set(quote: Quote) {
        quoteLabel.text = "\"\(quote.text)\""
        authorLabel.text = "— \(quote.author)"
    }
}
