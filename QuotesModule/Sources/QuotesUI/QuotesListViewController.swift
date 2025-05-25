//
//  QuotesListViewController.swift
//  QuotesModules
//
//  Created by Azis Ramdhan on 25/05/25.
//

import QuotesCore
import QuotesData
#if canImport(UIKit)
import UIKit

public class QuotesListViewController: UIViewController {
    
    // MARK: - Properties
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Quote>!
    private let quoteService = QuoteService()
    
    enum Section {
        case main
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        configureDataSource()
        loadQuotes()
    }
    
    // MARK: - Setup
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Quotes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addQuoteTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(QuoteCell.self, forCellWithReuseIdentifier: QuoteCell.reuseID)
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Quote>(collectionView: collectionView) {
            (collectionView, indexPath, quote) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuoteCell.reuseID, for: indexPath) as! QuoteCell
            cell.set(quote: quote)
            return cell
        }
    }
    
    // MARK: - Actions
    @objc private func addQuoteTapped() {
        let alertController = UIAlertController(title: "Add Quote", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Quote text"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Author"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self,
                  let quoteText = alertController.textFields?[0].text,
                  let author = alertController.textFields?[1].text,
                  !quoteText.isEmpty else { return }
            
            let newQuote = Quote(id: UUID().uuidString, text: quoteText, author: author)
            self.quoteService.add(quote: newQuote)
            self.updateData(with: self.quoteService.getQuotes())
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Data Loading
    private func loadQuotes() {
        let quotes = quoteService.getQuotes()
        updateData(with: quotes)
    }
    
    private func updateData(with quotes: [Quote]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Quote>()
        snapshot.appendSections([.main])
        snapshot.appendItems(quotes)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate
extension QuotesListViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let quote = dataSource.itemIdentifier(for: indexPath) else { return }
        let detailVC = QuoteDetailViewController(quote: quote)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
#endif
