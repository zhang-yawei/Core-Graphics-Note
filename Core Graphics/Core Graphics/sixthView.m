//
//  sixthView.m
//  Core Graphics
//
//  Created by zhang on 16/1/5.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "sixthView.h"

@implementation sixthView

-(id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), NO, 0);
        
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
        
        CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);

        CGContextFillPath(con);
        
        UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CYCLE_RECT];
        imgView.image = im;
        
        [self addSubview:imgView];
        
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
