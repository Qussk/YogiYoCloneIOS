//
//  OrderVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


class OderVC : UIViewController {
  
  var orderMager = OrderManager.shared
  var orderList: [OrderData] = []
  
  lazy var leftButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapButton))
  
  public var id : Int = 1
  let tableView2 = UITableView()
  let pikerView = UIPickerView()
  var toolBar = UIToolbar()
  var userString = "요청사항을 선택하세요."
  let pikerList = ["요청사항을 선택하세요.","단무지/치킨무/반찬류 안 주셔도 돼요.","벨은 누르지 말아 주세요!","도착 후 전화주시면 직접 받으러 갈게요.", "그냥 문 앞에 놓아주시면 돼요.", "직접 입력"]
  var open = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    orderList = orderMager.showMeOrderedList()
    setTableView2()
    buttonFrame()
    //  navigation()
    title = "배달 주문 결제"
    //   fetchPosts()
    print("orderMager : \(orderMager.showMeOrderedList())")
    addTotal()
    
  }
  
  
  func viewDidappear(_ animated: Bool) {
    buttonFrame()
  }
  override func viewDidLayoutSubviews() {
    buttonFrame()
  }
  
  
  //MARK:- POST
  func onPostShowBible(){
    let parameters: [String: Any] = [
//      "id": 864,
//        "order_menu": [orderList],
//        "address": "중림동",
//        "delivery_requests": "소스 많이 주세요",
//        "payment_method": "현금",
//        "order_time": "2020-10-06T14:07:24.922844Z"]
      "next" : "ee",
      "previous": "null",
      "results": [
        "id": "77",
        "order_menu": "[orderList]",
        "restaurant_name": "orderList[0].name",
        "restaurant_image": "https://yogiyo-s3.s3.ap-northeast-2.amazonaws.com/media/restaurant_image/%EC%B9%98%ED%82%A8%EB%8D%94%ED%99%88_20181211_Franchise%EC%9D%B4%EB%AF%B8%EC%A7%80%EC%95%BD%EC%A0%95%EC%84%9C_crop_200x200_JenKKxM.jpg",
        "status": "접수 대기 중",
        "order_time": " ",
        "review_written": false
      ]]
 
    let url = String(format: "http://52.79.251.125/orders")
    guard let serviceUrl = URL(string: url) else { return }
    
    var request = URLRequest(url: serviceUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
      return
    }
    request.httpBody = httpBody
    //   request.timeoutInterval = 20
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      if let response = response {
        print("response" , response)
      }
      if let data = data {
        do {
          let json = try JSONSerialization.jsonObject(with: data, options: [])
          print("json", json)
        } catch {
          print(error)
        }
      }
    }.resume()
  }
  
  let paymentButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customMainRed
    b.setTitle("결제 하기", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = UIFont(name: FontModel.customRegular, size: 23)
    b.addTarget(self, action: #selector(paymentDidTapButton(_:)), for: .touchUpInside)
    b.isHidden = true
    return b
  }()
  
  //MARK: -Navi
  func navigation(){
    title = "배달 주문 결제"
    navigationItem.leftBarButtonItem = leftButton
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
    navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  //MARK:- Action
  //뒤로가기
  @objc func didTapButton(_ sender : UIButton){
    navigationController?.popViewController(animated: true)
  }
  //결제하기
  @objc func paymentDidTapButton(_ sender : UIButton){
    onPostShowBible()
    alertController()    
  }
  
  func buttonFrame(){
    paymentButton.frame = CGRect(x: view.frame.minX + 20, y: view.frame.maxY - 20, width: view.frame.width - 40, height: -50)
    //  paymentButton.center = view.center
    view.addSubview(paymentButton)
  }
  
  
  //MARK:- UITableView
  func setTableView2(){
    
    pikerView.delegate = self
    pikerView.dataSource = self
    
    tableView2.dataSource = self
    tableView2.delegate = self
    tableView2.frame = view.frame
    tableView2.rowHeight = UITableView.automaticDimension //동적높이
    tableView2.backgroundColor = .white
    //tableView2.separatorStyle = .none
    tableView2.clipsToBounds = true
    view.addSubview(tableView2)
    
    //CustomOderCell
    tableView2.register(loginCell.self, forCellReuseIdentifier: "loginCell")//0-비회원
    tableView2.register(InformationCell.self, forCellReuseIdentifier: "InformationCell")//1-0
    tableView2.register(CustomOrderCell.self, forCellReuseIdentifier: "CustomOrderCell")//1-1
    tableView2.register(PaywithCell.self, forCellReuseIdentifier: "PaywithCell")//2
    tableView2.register(MembershipCell.self, forCellReuseIdentifier: "MembershipCell")//3-회원
    tableView2.register(unMembershipCell.self, forCellReuseIdentifier: "unMembershipCell")//3-비회원
    //OrderListCell
    tableView2.register(OrderListCell.self, forCellReuseIdentifier: "OrderListCell") //주문결제내역
    tableView2.register(paymentCell.self, forCellReuseIdentifier: "paymentCell")
    
  }
  
  func addTotal() {
    //tableview IndexPath값에 직접 접근
    let index = IndexPath(row: 0, section: 4)
    //tableview row값에 직접 접근
    let cellForrow = tableView2.cellForRow(at: index)
    //타입캐스팅으로 BuyLastTableViewCell불러오기
    let ordercell = cellForrow as? OrderListCell
    ordercell?.totalOrderPriceWon.text = "플리즈"
    print("출력이 되나요?")
    // print(totalPrice())
  }
  
  func alertController(){
    let alert = UIAlertController(title: "알림", message: "⛳️주문이 완료되었습니다~!🏇🚣‍♂️~!🧘‍♂️ 배달이 시작됩니다.🛥🚁", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { action in
      self.dismiss(animated: true)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}
