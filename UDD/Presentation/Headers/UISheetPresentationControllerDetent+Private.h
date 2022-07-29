//
//  UISheetPresentationControllerDetent+Private.h
//  UDD
//
//  Created by Kyubo Shim on 2022/07/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISheetPresentationControllerDetent (Private)
+ (UISheetPresentationControllerDetent *)_detentWithIdentifier:(NSString *)identifier constant:(CGFloat)constant;
@end

NS_ASSUME_NONNULL_END
