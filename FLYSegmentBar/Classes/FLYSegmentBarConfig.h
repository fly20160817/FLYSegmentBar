//
//  FLYSegmentBarConfig.h
//  FLYSegmentBar
//
//  Created by fly on 2020/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLYSegmentBarConfig : NSObject

UIKIT_EXTERN const CGFloat FLYSegmentBarIndicatorAutomaticWidth;

@property (nonatomic, strong) UIColor * segmentBarBackColor;
@property (nonatomic, strong) UIColor * itemNormalColor;
@property (nonatomic, strong) UIColor * itemSelectColor;
@property (nonatomic, strong) UIFont * itemFont;
@property (nonatomic, strong) UIColor * indicatorColor;
@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorWidth;// default is IndicatorAutomaticWidth


/**** 可以通过上面的属性设置，也可以通过下面的block一个一个往下点着赋值 ****/


//链式编程

//内部实现在block里面写，外界只负责调用,所以只读属性（平时写的block都是外部写代码块实现，内部负责调用）
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^backColor)(UIColor * color);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^itemNColor)(UIColor * color);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^itemSColor)(UIColor * color);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^itemF)(UIFont * font);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^indColor)(UIColor * color);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^indHeight)(CGFloat height);
@property (nonatomic, copy, readonly) FLYSegmentBarConfig *(^indWidth)(CGFloat width);


+ (instancetype)defaultConfig;

@end

NS_ASSUME_NONNULL_END
