//
//  ATree.swift
//  BinarySearch
//
//  Created by 辛忠翰 on 2017/10/26.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
struct ATree {
    var treeNodes = [BinaryTree<String>]()
    mutating func addLeaves(leaves: [String]) {
        for leaf in leaves{
            let node = BinaryTree.node(.empty, leaf, .empty)
            treeNodes.append(node)
        }
    }
    mutating func addANewNode(leftBinaryTree: BinaryTree<String>, Value: String, rightBinaryTree: BinaryTree<String>) -> Int{
        treeNodes.append(BinaryTree.node(leftBinaryTree, Value, rightBinaryTree))
        return treeNodes.count - 1
    }
    
}
