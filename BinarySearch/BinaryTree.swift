//
//  BinaryTree.swift
//  BinarySearch
//
//  Created by 辛忠翰 on 2017/10/26.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
indirect enum BinaryTree<T: Comparable>{
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    //MARK: Insert
    mutating func insertNewNode(newValue: T){
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree<T>{
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value{
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            }else{
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
        
    }
    
    //MARK: Traversal Inorder
   func traversalInorder(process: (T) -> ()){
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversalInorder(process: process)
            process(value)
            right.traversalInorder(process: process)
        }
    }
    
    //MARK: TraversalPreorder
    func traversalPreOrder(process: (T) -> ()){
        switch self{
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversalPreOrder(process: process)
            right.traversalPreOrder(process: process)
        }
    }
    
    //MARK: TraversalPostorder
    func traversalPostOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversalPostOrder(process: process)
            right.traversalPostOrder(process: process)
            process(value)
        }
    }
    
    //MARK: Searching
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value{
                return self
            }
            if searchValue < value{
                return left.search(searchValue: searchValue)
            }else if searchValue > value{
                return right.search(searchValue: value)
            }
        }
        return nil
    }
    
    //MARK: Build BTree: nodes:[Int] -> BTree
    func buildASampleBinaryTree(newValues:[Int]) -> BinaryTree<Int> {
        var bTree: BinaryTree<Int> = .empty
        for newValue in newValues{
            bTree.insertNewNode(newValue: newValue)
        }
        return bTree
    }
    
    func showThreeKindsofOrder() {
        print("This is InOrder~~")
        print(self.traversalInorder{ (num) in
            print(num)
        })
        print("------------------------")
        
        print("This is PreOrder~~")
        print(self.traversalPreOrder{ (num) in
            print(num)
        })
        print("------------------------")
        
        print("This is PostOrder~~")
        print(self.traversalPostOrder{ (num) in
            print(num)
        })
        print("------------------------")
    }
}
extension BinaryTree: CustomStringConvertible{
    var description: String{
        switch self {
        case .empty:
            return ""
        case .node(let left, let value, let right):
            return "value = \(value), left = [" + left.description + "], right = [" + right.description + "]"
        }
    }
    
    var count: Int{
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        default:
            return 0
        }
    }
    
}
