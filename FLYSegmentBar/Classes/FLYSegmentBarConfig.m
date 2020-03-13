//
//  FLYSegmentBarConfig.m
//  FLYSegmentBar
//
//  Created by fly on 2020/3/12.
//

#import "FLYSegmentBarConfig.h"

//把它的值设为负1，因为宽度不会设置为负，当设置indicator宽度的时候，发现为负1就用自动计算出来的值，不是负1就设置为调用者赋的值。
CGFloat const FLYSegmentBarIndicatorAutomaticWidth = -1;

@implementation FLYSegmentBarConfig

+ (instancetype)defaultConfig {
    
    FLYSegmentBarConfig *config = [[FLYSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor whiteColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorWidth = FLYSegmentBarIndicatorAutomaticWidth;
    
    return config;
}



#pragma mark - setters and getters

//get方法
-(FLYSegmentBarConfig *(^)(UIColor *))backColor
{
    return ^(UIColor *color){
        
        self.segmentBarBackColor = color;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(UIColor *))itemNColor
{
    return ^(UIColor *color){
        
        self.itemNormalColor = color;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(UIColor *))itemSColor
{
    return ^(UIColor *color){
        
        self.itemSelectColor = color;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(UIFont *))itemF
{
    return ^(UIFont *font){
        
        self.itemFont = font;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(UIColor *))indColor
{
    return ^(UIColor *color){
        
        self.indicatorColor = color;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(CGFloat))indHeight
{
    return ^(CGFloat height){
        
        self.indicatorHeight = height;
        
        return self;
    };
}

-(FLYSegmentBarConfig *(^)(CGFloat))indWidth
{
    return ^(CGFloat width){
        
        self.indicatorWidth = width;
        
        return self;
    };
}


@end
