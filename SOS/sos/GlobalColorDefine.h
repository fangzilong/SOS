//
//  GlobalColorDefine.h
//  CoolFlowInter
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Liam. All rights reserved.
//

#ifndef GlobalColorDefine_h
#define GlobalColorDefine_h

// 杭州个推官网
#define kGtAppId @"4hk1Zdfh6PAVQSnWRC3vI5"
#define kGtAppKey @"ZQL670Hfph9Qpx3bGfhY45"
#define kGtAppSecret @"Br7XzSHCekAa50vWBfZ1d6"

//颜色宏
#define D_RGB(r, g, b, a)           [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

//随机颜色
#define KMGlobalRandomColor         D_RGB(arc4random_uniform(256.0f), arc4random_uniform(256.0f), arc4random_uniform(256.0f), 1.0f)

#define KMGlobalBackground          D_RGB(240.0f, 242.0f, 244.0f, 1.0f)
#define KMGlobalGrayColor           D_RGB(144.0f, 144.0f, 144.0f, 1.0f)
#define KMGlobalPinkColor           D_RGB(251.0f, 51.0f, 105.0f, 1.0f)
#define KMGlobalBlueColor           D_RGB(18.0f, 173.0f, 245.0f, 1.0f)
#define KMGlobalBlackColor          D_RGB(40.0f, 40.0f, 40.0f, 1.0f)
#define KMGlobalLineColor           D_RGB(215.0f, 220.0f, 224.0f, 1.0f)
#define KMGlobalFlowColor           D_RGB(41.0f, 85.0f, 84.0f, 1.0f)

#define KMGlobalGiftRedColor        D_RGB(251.0f, 51.0f, 105.0f, 1.0f)
#define KMGlobalGiftColor           D_RGB(101.0f, 46.0f, 58.0f, 1.0f)
#define KMGlobalGiftBtnColor        D_RGB(255.0f, 199.0f, 56.0f, 1.0f)

#define KMGlobalGiftSOSColor        D_RGB(0.0f, 188.0f, 210.0f, 1.0f)


#endif /* GlobalColorDefine_h */
