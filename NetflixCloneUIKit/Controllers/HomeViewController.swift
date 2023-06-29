//
//  HomeViewController.swift
//  NetflixCloneUIKit
//
//  Created by MM on 27.06.2023.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending movies", "Trending Tv", "Popular", "Upcoming movies", "Top rated"]

    // Create tableView inside ViewController
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self // ?? This one
        homeFeedTable.dataSource = self // ?? And that one
        
        // adding header to tableView
        // почему так не сработало, а так сработало?
//        homeFeedTable.tableHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
        
        configNaviBar()
        getTrendingsMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configNaviBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        // почему не рендерится слева?
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: image, style: .done, target: self, action: nil)]
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
            ]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func getTrendingsMovies() {
        APICaller.shared.getTrendingMovies(completion: { result in
            switch result {

            case .success(let movies):
                print("Trendings")
            case .failure(let error):
                print(error)
            }
        })
        
        APICaller.shared.getPopularMovies(completion: { result in
            switch result {

            case .success(let movies):
                print("Popular")
            case .failure(let error):
                print(error)
            }
        })
        
        APICaller.shared.getTopRatedMovies(completion: { result in
            switch result {

            case .success(let movies):
                print("Top Rated")
            case .failure(let error):
                print(error)
            }
        })
        
        APICaller.shared.getUpcomingMovies(completion: { result in
            switch result {

            case .success(let movies):
                print("Upcomings")
            case .failure(let error):
                print(error)
            }
        })
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // table has 20 section
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = .init(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.textColor = UIColor.white
    }
    
    // table has 1 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    // create the row itself
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creating instance of a custom row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell()}

        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies { result in
                switch result {
                case .success(let title):
                    cell.config(with: title)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
                APICaller.shared.getTrendingTv { result in
                    switch result {
                    case .success(let title):
                        cell.config(with: title)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        case Sections.Popular.rawValue:
                    APICaller.shared.getTrendingMovies { result in
                        switch result {
                        case .success(let title):
                            cell.config(with: title)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        case Sections.Upcoming.rawValue:
                        APICaller.shared.getUpcomingMovies { result in
                            switch result {
                            case .success(let title):
                                cell.config(with: title)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
        case Sections.TopRated.rawValue:
                            APICaller.shared.getTopRatedMovies { result in
                                switch result {
                                case .success(let title):
                                    cell.config(with: title)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
        
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    // height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    // height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
}
