//
//  thirdView.m
//  Core Graphics
//
//  Created by zhang on 15/11/16.
//  Copyright © 2015年 zhangwei. All rights reserved.
//



#import "thirdView.h"



@implementation thirdView


-(id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        

        [self.layer setNeedsDisplay];
        
        
        
    }
    return self;
}


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CYCLE_RECT];
    [[UIColor greenColor] setFill];
    [path fill];
    UIGraphicsPopContext();

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
