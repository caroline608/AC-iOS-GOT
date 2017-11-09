//
//  SeasonsViewController.swift
//  GOT-StudentVersion
//
//  Created by Keshawn Swanston on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SeasonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    var episodes = [GOTEpisode]()
    var searchBar = UISearchBar()

    
    
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredEpisodeArr: [GOTEpisode] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return episodes
        }
//        if let scopeTitles = self.searchBar.scopeButtonTitles {
//            let selectedIndex = self.searchBar.selectedScopeButtonIndex
//            let filteringCriteria = scopeTitles[selectedIndex]
//            switch filteringCriteria {
//            case "Title":
//                return episodes.filter{(episode) in episode.name.lowercased().contains(searchTerm.lowercased())
//                }
//            case "Season":
//                return episodes.filter{String($0.season).contains(searchTerm)}
//            default:
//                return episodes
//            }
//        }
//        return episodes
        return episodes.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        episodes = GOTEpisode.allEpisodes
        self.searchBar.delegate = self
        self.searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBarButton = navigationItem.rightBarButtonItem
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        showSearchBar()
    }
    
//    https://stackoverflow.com/questions/24593599/how-to-animate-add-uisearchbar-on-top-of-uinavigationbar
    func showSearchBar() {
        searchBar.alpha = 0
        navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.5, animations: {
            self.searchBar.alpha = 1
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    func hideSearchBar() {
        navigationItem.titleView = nil
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        hideSearchBar()
//    }
    
    
    
    // MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEpisodeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = filteredEpisodeArr[indexPath.row]
        let leftAlligned = episode.season % 2 == 1
        if leftAlligned {
            let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasons", for: indexPath)
            if let cell = cell as? OddSeasonTableViewCell {
                let rowToSetUp = indexPath.row
                let episodeToSetUp = filteredEpisodeArr[rowToSetUp]
                cell.nameLabel.text = episodeToSetUp.name
                cell.ssnDetailLabel.text = "S:\(episodeToSetUp.season) E: \(episodeToSetUp.number)"
                cell.oddImage.image = UIImage(named: episodeToSetUp.mediumImageID)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "evenSeasons", for: indexPath)
            if let cell = cell as? EvenSeasonTableViewCell {
                let rowToSetUp = indexPath.row
                let episodeToSetUp = filteredEpisodeArr[rowToSetUp]
                cell.nameLabel.text = episodeToSetUp.name
                cell.ssnDetailLabel.text = "S:\(episodeToSetUp.season) E: \(episodeToSetUp.number)"
                cell.evenImage.image = UIImage(named: episodeToSetUp.mediumImageID)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination =  segue.destination as? EpisodeDetailsViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.filteredEpisodeArr[selectedRow]
            destination.episode = selectedEpisode
        }
    }
    
    // MARK: - Search bar delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
        hideSearchBar()
    }
}
