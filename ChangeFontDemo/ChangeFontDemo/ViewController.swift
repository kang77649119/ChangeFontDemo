//
//  ViewController.swift
//  ChangeFontDemo
//
//  Created by 也许、 on 2016/11/15.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.width
let screenH = UIScreen.main.bounds.height
let statusBarH : CGFloat = 20
let cellId = "cellId"

class ViewController: UIViewController {
    
    // 表格数据
    let datas = [ "你曾是我的天，让我仰着脸就有一切，叫我如何面对，没有你的夜", "无奈这天方知你最好，因始终得不到", "怕被迷魂，扶着感情，得到细心只怕丧心，但却不懂去，弄完假再成真", "一颗心可以破碎，但是不可活受罪", "也许喜欢怀念你，多于看见你；我也许喜欢想象你，受不了真的一起", "思念是一种很玄的东西，如影随形" ]
    
    // 字体数据
    let fonts = ["Gaspar Regular", "MFJinHei_Noncommercial-Regular", "MFTongXin_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    // 表格
    lazy var table : UITableView = {
        
        let table : UITableView = UITableView(frame: CGRect(x: 0, y: statusBarH, width: screenW, height: screenH - statusBarH - 100), style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        table.dataSource = self
        return table
    
    }()
    
    // 更换字体按钮
    lazy var btn : UIButton = {
        
        let btn : UIButton = UIButton(frame: CGRect(x: 0, y: screenH - 100, width: 100, height: 50))
        btn.center.x = self.view.center.x
        btn.backgroundColor = UIColor.orange
        btn.setTitle("改变字体", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(self.changeFont), for: .touchUpInside)
        return btn
        
    }()
    
    // 字体名称
    var fontName:String?
    
    var index = 0
    
    // 更换字体方法
    @objc func changeFont() {
     
        // 随机数
        let random = Int(arc4random_uniform(UInt32(self.fonts.count)))
        self.fontName = self.fonts[random]
        self.table.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(table)
        self.view.addSubview(btn)
        
    }

}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if let name = fontName {
            cell?.textLabel?.font = UIFont(name: name, size: 17)
        }
        
        cell?.textLabel?.text = self.datas[indexPath.row]
        
        return cell!
        
    }

}

