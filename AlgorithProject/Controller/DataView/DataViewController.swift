//
//  DataViewController.swift
//  AlgorithProject
//
//  Created by Wilsher, Ethan on 11/8/17.
//  Copyright © 2017 Wilsher, Ethan. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController
{
    lazy var bucketList : [BucketItem] =
    {
       return loadBucketListFromFile()
    }()
    
    private func loadBucketListFromFile() ->[BucketItem]
    {
        var items = [BucketItem]()
        if let filePath = Bundle.main.url(forResource: "bucket", withExtension: "csv")
        {
            do
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = int.components(seperatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(seperatedBy: ",")
                    items.append(BucketItem(contents: item[0],author: item[1]))
                }
            }
            catch
            {
                print("File Load Error")
            }
        }
        return items
    }
    
    //MARK: TableView Code
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection secction: Int) -> Int
    {
        return bucketList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier", for: indexPath) as! BucketItemCell
        
        currentCell.bucketItem = bucketList[indexPath.row]
        //          currentCell.bucketItemSignature.text = currentCell.bucketItem.itemAuthor
        
        return currentCell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
