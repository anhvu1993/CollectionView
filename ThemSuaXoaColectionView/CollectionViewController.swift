//
//  ViewController.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    var listMacOs = [MacOs]()
    override func viewDidLoad() {
        super.viewDidLoad()
        listMacOs =
            [MacOs(name: "MAC 1", imageData: (UIImage(named: "1")?.pngData())!),
             MacOs(name: "MAC 2", imageData: (UIImage(named: "2")?.pngData())!),
             MacOs(name: "MAC 3", imageData: (UIImage(named: "3")?.pngData())!),
             MacOs(name: "MAC 4", imageData: (UIImage(named: "4")?.pngData())!),
             MacOs(name: "MAC 5", imageData: (UIImage(named: "5")?.pngData())!),
             MacOs(name: "MAC 6", imageData: (UIImage(named: "1")?.pngData())!),
             MacOs(name: "MAC 7", imageData: (UIImage(named: "2")?.pngData())!),
             MacOs(name: "MAC 8", imageData: (UIImage(named: "3")?.pngData())!),
             MacOs(name: "MAC 9", imageData: (UIImage(named: "4")?.pngData())!),
             MacOs(name: "MAC 10", imageData: (UIImage(named: "5")?.pngData())!)
        ]
    }
    @IBAction func unwindToCollectionview(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source as! ToolViewController
        guard let indexPaths = collectionView.indexPathsForSelectedItems else { return }
            if indexPaths.count != 0 {
                for indexPath in indexPaths {
                    listMacOs[indexPath.item].name      = source.textField.text
                    listMacOs[indexPath.item].imageData = source.image?.pngData()!
                }
            }else {
                let macOs  = MacOs(name: source.textField.text! , imageData: ((source.image?.pngData())!))
                listMacOs.insert(macOs, at: 0)
                collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }
        
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Detail":
            guard let detailsViewController = segue.destination as? DetailViewController else {return }
            if let indexPath    = collectionView.indexPathsForSelectedItems {
                let item        = indexPath.first?.row
                let data        = listMacOs[item!]
                detailsViewController.photos     = data.imageData
                detailsViewController.textString = data.name
            }
        case "Edit":
            //            guard let toolViewController = segue.destination as? ToolViewController else {return}
            //            if let indexPath1 = collectionView.indexPathsForSelectedItems {
            //                let item1 = indexPath1.first?.row
            //                let data1 = listMacOs[item1!]
            //                toolViewController.textFields = data1.name
            //            }
            print("hello")
            
        default:
            print("...")
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMacOs.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let detailMacOs      = listMacOs[indexPath.item]
        cell.text_label.text = detailMacOs.name
        cell.image.image     = UIImage(data: detailMacOs.imageData!)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //            listMacOs.remove(at: indexPath.row)
        //            collectionView.deleteItems(at: [indexPath])
    }
    
}

