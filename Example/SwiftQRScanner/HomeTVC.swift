//
//  HomeTVC.swift
//  HealthTreasureTest
//
//  Created by 刘帅彪 on 2022/11/19.
//

import UIKit
import SwiftQRScanner
class HomeTVC: UITableViewController {
    var homes = ["home1","home2","home3","home4","home5","home6","home7","home8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //去除tableView顶部导航栏
        self.navigationController?.navigationBar.isTranslucent = false
        //去除底部和顶部的空白
        self.tableView.contentInset = UIEdgeInsets(top: -45, left: 0, bottom: -35, right: 0);
    }



    // MARK: - Table view data source

    //有一段
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //有多少行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //把最上面的导航栏也作为cell了,所以+1
        return homes.count+1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //把用户点的那一行转化为cell
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! HomeTVCell
        //如果点的是0,代表是top
        if indexPath.row == 0{
            cell.imageCell.image = UIImage(named: "homeTop3")
            return cell
        }
        //否则对应真正的按钮图片
        else{
            cell.imageCell.image = UIImage(named: "home\(indexPath.row)")
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        找到storyboard上的vc
        switch indexPath.row{
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ResultID\(indexPath.row)") as! ResultVC1
            //跳转到结果1
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            //扫码
            scanQRCode()
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SelfCheckID") as! SelfCheckVC
            //跳转到结果1
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
    }

    func scanQRCode(){
                var configuration = QRScannerConfiguration()
                configuration.flashOnImage = UIImage(named: "flash-on")
                let scanner = QRCodeScannerController(qrScannerConfiguration: configuration)
                scanner.delegate = self
        
//                self.present(scanner, animated: true, completion: nil)
                navigationController?.pushViewController(scanner, animated: true)
    }
    
    
}
extension HomeTVC: QRScannerCodeDelegate {
    func qrScannerDidFail(_ controller: UIViewController, error: QRCodeError) {
        print("error:\(error.localizedDescription)")
    }
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        let vc = storyboard?.instantiateViewController(withIdentifier: kResult) as! ResultVC
        navigationController?.pushViewController(vc, animated: true)
                print("扫描结束")
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("退出扫描")
    }
}
