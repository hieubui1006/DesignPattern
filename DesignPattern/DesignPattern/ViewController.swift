//
//  ViewController.swift
//  DesignPattern
//
//  Created by mrhb on 11/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sol = Solution().isAnagram("anagram", "nagaram")
    }
    
    
}
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var s_merge = [s+t]
        var countItem = 0
        var arrIndexes = [Int]()
        for i in 0..<s_merge.count {
            guard !arrIndexes.contains(i) else { continue }
            for j in i+1..<s_merge.count {
                guard !arrIndexes.contains(j) else { continue }
                if s_merge[i] == s_merge[j] {
                    arrIndexes.append(j)
                    countItem += 1
                    break
                }
            }
        }
        return s_merge.count == countItem * 2
    }
}
