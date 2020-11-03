//
//  MainTableViewController.swift
//  MurmanskNews
//
//  Created by Viktor on 02.11.2020.
//

import UIKit

class MainTableViewController: UITableViewController  {
    private let imageView = UIImageView(image: UIImage(named: "settings"))
    private var viewModel: PostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureRefreshControl ()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifiers.cellID)
        
        viewModel = PostViewModel(delegate: self)
        viewModel.fetchPosts()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)  {
        viewModel.fetchPosts(first: false)
    }
    
    @objc func fetchNextPost()  {
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
}

//MARK: - Navigation Bar
extension MainTableViewController {
    private struct NavigationBarConst {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 40
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
        /// Image height/width for Landscape state
        static let ScaleForImageSizeForLandscape: CGFloat = 0.65
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - NavigationBarConst.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (NavigationBarConst.NavBarHeightLargeState - NavigationBarConst.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = NavigationBarConst.ImageSizeForSmallState / NavigationBarConst.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        // Value of difference between icons for large and small states
        let sizeDiff = NavigationBarConst.ImageSizeForLargeState * (1.0 - factor) // 8.0
        
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = NavigationBarConst.ImageBottomMarginForLargeState - NavigationBarConst.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (NavigationBarConst.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Routes"
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -NavigationBarConst.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -NavigationBarConst.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: NavigationBarConst.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
    
    func configureRefreshControl () {
        // Add the refresh control to your UIScrollView object.
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(fetchNextPost), for: .valueChanged)
    }
}

//MARK: - Table View DataSource
extension MainTableViewController {
    private enum CellIdentifiers {
        static let cellID = "Post"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.currentCount)
        return viewModel.currentCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cellID, for: indexPath)
        
        //as! PostTableViewCell
        //      if isLoadingCell(for: indexPath) {
        //
        //      } else {
        //        cell.configure(with: viewModel.post(at: indexPath.row))
        //      }
        //      return cell
        //    }
        
        
        
        cell.textLabel?.text =   viewModel.post(at: indexPath.row).title
        
        print(viewModel.post(at: indexPath.row))
        
        return cell
    }
}

extension MainTableViewController: PostViewModelDelegate {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
//        guard let newIndexPathsToReload = newIndexPathsToReload else {
//            tableView.reloadData()
//            return
//        }
//
//
//        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
//        tableView.reloadRows(at: indexPathsToReload, with: .automatic)

        tableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        print(reason)
    }
}

private extension MainTableViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}


