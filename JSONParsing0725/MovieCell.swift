//
//  MovieCell.swift
//  JSONParsing0725
//
//  Created by Woojin on 25/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var thnailnailImage: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    
    //행의 개수를 설정해주는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    //셀을 생성해주는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.lblTitle.text = movieList[indexPath.row].title
        //이미지 URL로 부터 이미지를 다운로드 받기
        let imageURL = URL(string:movieList[indexPath.row].imageUrl)
        let imageData = try! Data(contentsOf: imageURL!)
        //이미지 만들기
        let image = UIImage(data:imageData)
        //이미지 출력
        cell.thnailnailImage.image = image
        return cell
    }
    
    //셀의 높이를 설정하는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
}

