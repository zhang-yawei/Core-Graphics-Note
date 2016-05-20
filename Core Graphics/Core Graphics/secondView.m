//
//  secondView.m
//  Core Graphics
//
//  Created by zhang on 15/11/13.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "secondView.h"

@implementation secondView


-(id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
// 使用Core Graphics 绘制蓝圈

    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CYCLE_RECT);
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillPath(con);

    
    
}


@end
