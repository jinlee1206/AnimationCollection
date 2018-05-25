//
//  ViewController.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 21..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    let classNames = [ButtonViewController.className]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
 
    }

}


extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    
    private func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: MainTableViewCell.self)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(with:MainTableViewCell.self, for: indexPath)
        cell.label.text = classNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(ButtonViewController.fromStoryboard(), animated: true)
        
        
    }
    
}

