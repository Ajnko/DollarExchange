//
//  InfoTableViewCell.swift
//  DollarExchange
//
//  Created by Abdulbosid Jalilov on 08/01/23.
//

import UIKit
import SnapKit

class InfoTableViewCell: UITableViewCell {

    
    let titleLabel: UILabel = {
       let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .left
        return title
    }()
    
    let datelabe: UILabel = {
       let date = UILabel()
        date.font = .boldSystemFont(ofSize: 20)
        date.textAlignment = .left
        return date
    }()
    
    let codeLabel: UILabel = {
       let code = UILabel()
        code.font = .boldSystemFont(ofSize: 20)
        code.textAlignment = .left
        return code
    }()
    
    let priceLabel: UILabel = {
       let price = UILabel()
        price.font = .boldSystemFont(ofSize: 20)
        price.textAlignment = .left
        return price
    }()
    
    let cellPriceLabel: UILabel = {
       let cell = UILabel()
        cell.font = .boldSystemFont(ofSize: 20)
        cell.textAlignment = .left
        return cell
    }()
    
    let buyPriceLabel: UILabel = {
       let buy = UILabel()
        buy.font = .boldSystemFont(ofSize: 20)
        buy.textAlignment = .left
        return buy
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.left.equalTo(self.snp.left).offset(20)
        }
        
        self.addSubview(datelabe)
        datelabe.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.left.equalTo(titleLabel.snp.right).offset(20)
        }
        
        self.addSubview(codeLabel)
        codeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        self.addSubview(cellPriceLabel)
        cellPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        self.addSubview(buyPriceLabel)
        buyPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(cellPriceLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        
        
        
        
        
    }

}
