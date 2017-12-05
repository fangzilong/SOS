//
//  FWRegularExpression.h
//  SOS
//
//  Created by user on 2017/12/2.
//  Copyright © 2017年 fangwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FWRegularExpression : NSObject

/**
 *  验证身份证号（15位或18位数字）
 */

//身份证
+(BOOL)checkUserID:(NSString *)userID;

+(BOOL)isMobilePhone:(NSString *)phoneNum;


@end
