//
//  FieldSurveyController.swift
//  FieldSurveyChallenge
//
//  Created by Alex Testin on 7/21/17.
//  Copyright © 2017 Alex Testin. All rights reserved.
//

import Foundation
import UIKit

class FieldSurveyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "field_observations", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            if let dictionary = json as? [String: Any] {
                if let observations = dictionary["observations"] as? [Any] {
                    // access nested dictionary values by key
                    for observation in observations {
                        guard let observDict = observation as? [String: Any] else { return }
                        guard let classification = observDict["classification"] as? String else { return }
                        guard let title = observDict["title"] as? String else { return }
                        guard let description = observDict["description"] as? String else { return }
                        guard let date = observDict["date"] as? String else { return }
                        
                        print(classification)
                        print(title)
                        print(description)
                        print(date)
                        print(" ")
                    }
                }
            }
            
//            guard let array = json as? [Any] else { return }
//
//            for observation in array {
//                guard let observDict = observation as? [String: Any] else { return }
//                guard let classification = observDict["classification"] as? String else { return }
//                guard let title = observDict["title"] as? String else { return }
//                guard let description = observDict["description"] as? String else { return }
//                guard let date = observDict["date"] as? String else { return }
                
//                print(classification)
//                print(title)
//                print(description)
//                print(date)
//                print("a")
//            }
        }
        catch {
            print(error)
        }
        
    }
    
    
    let colors: [(color: UIColor, text: String)] = [
        (UIColor.red,"red"),
        (UIColor.orange,"orange"),
        (UIColor.yellow,"yellow"),
        (UIColor.green,"green"),
        (UIColor.blue,"blue"),
        (UIColor.purple,"purple"),
        (UIColor.brown,"brown")]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(colors.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = colors[indexPath.row].text
        cell.backgroundColor = colors[indexPath.row].color
        
        return(cell)
    }
}
