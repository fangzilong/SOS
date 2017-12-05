//
//  SosTextField.m
//  SOS
//
//  Created by user on 2017/12/2.
//  Copyright © 2017年 fangwei. All rights reserved.
//

#import "SosTextField.h"

@implementation SosTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 20 , 0 );
}

// 控制文本的位置，左右缩 30
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 20 , 0 );
}

@end
