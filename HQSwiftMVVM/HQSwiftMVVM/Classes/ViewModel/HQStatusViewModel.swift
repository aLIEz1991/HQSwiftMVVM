//
//  HQStatusViewModel.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/8/30.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

class HQStatusViewModel: CustomStringConvertible {
    
    var status: HQStatus
    
    /// 会员图标
    var memberIcon: UIImage?
    /// 认证图标(-1:没有认证, 0:认证用户, 2,3,5:企业认证, 220:达人)
    var vipIcon: UIImage?
    
    init(model: HQStatus) {
        self.status = model
        
        // 会员等级
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7 {
            let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
            memberIcon = UIImage(named: imageName)
        }
        
        // 认证图标
        switch model.user?.verified_type ?? -1 {
        case 0:
            vipIcon = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            vipIcon = UIImage(named: "avatar_enterprise_vip")
        case 220:
            vipIcon = UIImage(named: "avatar_grassroot")
        default:
            break
        }
    }
    
    var description: String {
        return status.description
    }
}