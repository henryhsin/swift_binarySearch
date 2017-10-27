//
//  ViewController.swift
//  BinarySearch
//
//  Created by 辛忠翰 on 2017/10/26.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var binaryTree: BinaryTree<Int> = .empty
        let newValues = [7, 10, 2, 1, 5, 9]
        binaryTree = binaryTree.buildASampleBinaryTree(newValues: newValues)
        print(binaryTree.description)
        binaryTree.showThreeKindsofOrder()
        print(binaryTree.search(searchValue: 2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doASampleBinaryTree(){
        var aTree = ATree.init()
        aTree.addLeaves(leaves: ["5", "a", "10", "4", "3", "b" ])
        let indexAMinusTen = aTree.addANewNode(leftBinaryTree: aTree.treeNodes[1], Value: "-", rightBinaryTree: aTree.treeNodes[2])
        let indexFiveMulti = aTree.addANewNode(leftBinaryTree: aTree.treeNodes[0], Value: "*", rightBinaryTree: aTree.treeNodes[indexAMinusTen])
        let indexMinusFour = aTree.addANewNode(leftBinaryTree: .empty, Value: "-", rightBinaryTree: aTree.treeNodes[3])
        let indexThreeDivideB = aTree.addANewNode(leftBinaryTree: aTree.treeNodes[4], Value: "/", rightBinaryTree: aTree.treeNodes[5])
        let indexMinusFourMulti = aTree.addANewNode(leftBinaryTree: aTree.treeNodes[indexMinusFour], Value: "*", rightBinaryTree: aTree.treeNodes[indexThreeDivideB])
        let indexRoot = aTree.addANewNode(leftBinaryTree: aTree.treeNodes[indexFiveMulti], Value: "+", rightBinaryTree: aTree.treeNodes[indexMinusFourMulti])
        print(aTree.treeNodes[indexRoot].description)
        print("The total num of nodes is \(aTree.treeNodes[indexRoot].count)")
    }
}

