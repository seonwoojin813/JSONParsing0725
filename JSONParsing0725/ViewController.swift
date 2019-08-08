//
//  ViewController.swift
//  JSONParsing0725
//
//  Created by Woojin on 25/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //영화제목과 이미지 경로를 저장할 tuple을 생성하고 tuple의 배열을 생성
    typealias MovieRecord = (title:String, imageUrl: String)
    var movieList = [MovieRecord]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //다운로드 받을 주소
        let addr = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=20&genreId=&order=releasedateasc"
        
        //URL로 만들기
        let url = URL(string:addr)
        
        //데이터 다운로드 받기
        let data = try! Data(contentsOf: url!)

        
        //JSON 파싱 - NSDictionary로 강제 형 변환
        //json 데이터의 시작이 {로 시작해서
        //[로 시작하면 NSArray로 변환
        let jsonResult = try!
        JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        //print(jsonResult)
        
         //hoppin 키의 값을 디셔너리로 가져오기
         let hoppin = jsonResult["hoppin"] as! NSDictionary
         //movies 키의 값을 디셔너리로 가져오기
         let movies = hoppin["movies"] as! NSDictionary
         
         //movies 키의 값을 배열로 가져오기
         let movie = movies["movie"] as! NSArray
         
         //배열 순회
         for temp in movie{
         //배열 각각의 데이터를 디셔너리로 변환
         let imsi = temp as! NSDictionary
         //title 키와 thumbnailImage 키의 값을 가져오기
         let title = imsi["title"] as! String
         let thumbnailImage = imsi["thumbnailImage"] as! String
         //파싱한 데이터를 데이터 배열에 추가
         movieList.append((title:title, imageUrl:thumbnailImage))
            
         tableView.delegate = self
         tableView.dataSource = self
         //네이비게이션 바의 중앙에 제목 설정
         self.title = "영화목록"
        }
 
         print(movieList)
         
         
         //print(movies)
 
 
        //문자열로 변환
        //let jsonString = String(data: data, encoding: .utf8)
        
        //print(jsonString)
        
  }
}
