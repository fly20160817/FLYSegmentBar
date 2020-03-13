//
//  FLYSegmentBarVC.h
//  FLYSegmentBar
//
//  Created by fly on 2020/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLYSegmentBarVC : UIViewController

- (void)setUpWithTitles: (NSArray <NSString *>*)titles childVCs: (NSArray <UIViewController *>*)childVCs;

@end

NS_ASSUME_NONNULL_END
