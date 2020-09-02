//
//  SecondViewController.swift
//  AppProject
//
//  Created by APPLE on 01/09/20.
//  Copyright © 2020 Technize. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var expertise = [Dictionary<String, Any>]()
        var a1 = 100
    var a2 = 101
    var a3 = 102
    var a4 = 103
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.view.backgroundColor = .clear
            
            tableView.tableFooterView = UIView(frame: .zero)
            createDatSource()
            tableView.dataSource = self
            tableView.delegate = self
        }
        
        func createDatSource() {
            expertise.append(["title": "Section 1", "value": ["Cell-1", "Cell-2", "Cell-3"]])
            expertise.append(["title": "Section 2", "value": ["Cell-4", "Cell-5", "Cell-6","Cell-7"]])
            expertise.append(["title": "Section 3", "value": ["Cell-8", "Cell-9", "Cell-10"]])
            expertise.append(["title": "Section 4", "value": ["Cell-11", "Cell-12", "Cell-13","Cell-14","Cell-15","Cell-16","Cell-17"]])

        }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return expertise.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard let codersNames = expertise[section]["value"] as? [String] else {
                return 0
            }
            return codersNames.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SectionTableViewCell
            guard let codersNames = expertise[indexPath.section]["value"] as? [String] else {
                return cell
            }
            cell.setCoderName(codersNames[indexPath.row])
            cell.togbtn.tag = indexPath.row
            print(cell.togbtn.tag)
            if(indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 3)
            {
                cell.togbtn.isOn = true
            }
            else
            {
                cell.togbtn.isOn = false
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
            view.backgroundColor = .systemBlue
            let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: view.frame.size.width, height: 50.0))
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            if let title = expertise[section]["title"] as? String {
                titleLabel.text = title
            }
            view.addSubview(titleLabel)
            let switchDemo = UISwitch(frame:CGRect(x: view.frame.size.width - 85, y: 12.5, width: 47, height: 31))
            switchDemo.isOn = true
            switchDemo.setOn(true, animated: false)
//            switchDemo.addTarget(SecondViewController.self, action: Selector(("switchValueDidChange")), for: .valueChanged)
            switchDemo.addTarget(self,action: #selector(helloButton),for: .touchUpInside
            )
            switchDemo.tag = section
//print(section)
           view.addSubview(switchDemo)
            
            return view
        }
    @IBAction func helloButton(sender:UIButton){
        if ((sender as AnyObject).isOn == true){
           print("on")
            print(sender.tag)
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SectionTableViewCell
            if(sender.tag == 0)
            {
            cell.togbtn.isOn = false
            print("HI")
            tableView.reloadData()
            }
            else if(sender.tag == 1)
            {
                cell.togbtn.isOn = false
                tableView.reloadData()
            }
       }
       else{
           print("off")
       }
    }
       
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50.0
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
            
    }
    
}
