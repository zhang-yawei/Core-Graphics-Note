//
//  firstView.m
//  Core Graphics
//
//  Created by zhang on 15/11/13.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "firstView.h"

@implementation firstView

-(id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}




-(void) drawRect: (CGRect) rect {
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100,200,100,100)];
    
    //  UIBezierPath* p = [UIBezierPathbezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
