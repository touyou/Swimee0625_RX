//
//  ViewController.swift
//  Swimee0625
//
//  Created by 荒川陸 on 2016/06/24.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeViewControllerDelegate {
    func changeName(name: String)
}

final class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var user: User?

    var delegate: HomeViewControllerDelegate!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize user
        user = User(name: "hemhem")
        User.loginUser = user
        
        //tableViewSetting
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.registerNib(UINib(nibName: String(nameCell.self), bundle: nil),
                              forCellReuseIdentifier: "nameCell")
        tableView.registerNib(UINib(nibName: String(toSettingCell.self), bundle: nil),
                              forCellReuseIdentifier: "toSettingCell")
        
        delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSetting" {
            let viewController = segue.destinationViewController.childViewControllers.first as! SettingViewController
            viewController.delegate = self
        }
    }
}

// MARK: HomeViewControllerDelegate

extension HomeViewController: HomeViewControllerDelegate {
    
    func changeName(name: String) {
        user?.name = name
        self.tableView.reloadData()
    }
    
}

// MARK: toSettingCellDelegate

//extension HomeViewController: toSettingCellDelegate {
//    
//    func settingView() {
//        self.performSegueWithIdentifier("toSetting", sender: nil)
//    }
//
//}

// MARK: TableViewDelegate, TableViewDataSource

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    //DataSource Method
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0:
            let newCell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! nameCell
            newCell.set(user!)
            cell = newCell
        case 1:
            let newCell = tableView.dequeueReusableCellWithIdentifier("toSettingCell", forIndexPath: indexPath) as! toSettingCell
//            newCell.delegate = self
            newCell.settingButton.rx_tap.subscribe { [weak self] _ in
                self!.performSegueWithIdentifier("toSetting", sender: nil)
            }.addDisposableTo(disposeBag)
            cell = newCell
        default:
            cell = UITableViewCell()
        }
        return cell
    }
    
    //Delegate Method
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
}
