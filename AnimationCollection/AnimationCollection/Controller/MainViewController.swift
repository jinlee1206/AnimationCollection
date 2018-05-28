//
//  ViewController.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 21..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    let viewControllers = [ButtonViewController.self,
                   ChainAnimationViewController.self,
                   CircleProgressBarViewController.self
                   
                  ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        animationTableView()
    }

}


extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    
    private func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: MainTableViewCell.self)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(with:MainTableViewCell.self, for: indexPath)

        cell.label.text = viewControllers[indexPath.row].className
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.navigationController?.pushViewController(viewControllers[indexPath.row].fromStoryboard(), animated: true)
        
        }
    
    
    
    private func animationTableView() {
        
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = self.tableView.bounds.size.height
        
        for cell in cells {
            
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
        }

        var delayCounter = 0
        for cell in cells {
            
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delayCounter += 1
            
        }
 
    }
    
    
    
}











