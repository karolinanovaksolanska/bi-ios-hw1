//
//  DetailViewController.swift
//  BI-IOS
//
//  Created by Karolina Solanska on 20/11/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
     weak var scrollView : UIScrollView!
    
    weak var voteButton: UIButton!
    weak var pushButton: UIButton!
    weak var contentView: UIView!
    weak var pageLabel : UILabel!
    weak var descriptionLabel : UILabel!
    weak var ingredience: UITableView!
    var data = [RecipeDetail]()
    var _id = ""
    var dataManager = DataManager()
    
    func dataLoaded() -> Void {
        navigationItem.title = data[0].name
        //name
        let pageLabel = UILabel()
        pageLabel.textAlignment = .left
        pageLabel.textColor = .black
        pageLabel.text = data[0].name
        view.addSubview(pageLabel)
        pageLabel.snp.makeConstraints { make in
           make.left.equalTo(5)
            make.height.equalTo(30)
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(10)
        }
        
        //ingredience

        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .black
        descriptionLabel.lineBreakMode =  NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = data[0].description
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.width.equalTo(300)
            make.top.equalTo(pageLabel.snp.bottom).offset(10)
        }
        
        let voteButton = UIButton(frame: view.bounds)
        voteButton.setTitle("Vote", for: .normal)
        voteButton.setTitleColor(.white, for: .normal)
        voteButton.backgroundColor = UIColor(red:0.55, green:0.47, blue:1.00, alpha:1.0)
        view.addSubview(voteButton)
        voteButton.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.width.equalTo(200)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top).offset(-50)
        }
        self.voteButton = voteButton
        
        self.pageLabel = pageLabel
        self.descriptionLabel = descriptionLabel
        voteButton.addTarget(self, action: #selector(voteButtonTapped(_:)), for: .touchUpInside)
        self.ingredience.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        let ingredience = UITableView()
        ingredience.dataSource = self
        view.addSubview(ingredience)
        
    
        self.ingredience = ingredience
        
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 400, height: 2300)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        // ----- Content View -----
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
//        let contentView = UIView(frame: view.bounds)
//        view.addSubview(contentView)
//        self.contentView = contentView
//
//        let pushButton = UIButton()
//        pushButton.setTitle("Push", for: .normal)
//        pushButton.setTitleColor(.white, for: .normal)
//        pushButton.backgroundColor = .black
//        view.addSubview(pushButton)
//        pushButton.snp.makeConstraints { make in
//            make.trailing.equalTo(-10)
//            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(10)
//        }
//        self.pushButton = pushButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getRecipe(id: _id) { [weak self] recipe in
            self?.data.append(recipe)
            self?.dataLoaded();
        }
        navigationItem.title = "Detail receptu"
        
        //pushButton.addTarget(self, action: #selector(pushButtonTapped(_:)), for: .touchUpInside)
        //print("BubblesViewController did load.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("BubblesViewController will appear.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BubblesViewController did appear.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("BubblesViewController will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("BubblesViewController did disappear.")
    }
    
    @objc func voteButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func pushButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    
}
extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        cell.textLabel?.text = self.data[0].ingredients[indexPath.row]
        return cell
    }
}
