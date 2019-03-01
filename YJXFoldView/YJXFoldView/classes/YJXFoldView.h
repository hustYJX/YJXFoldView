//
//  YJXFoldView.h
//  YJXFoldView
//
//  Created by 尤建峡 on 2019/3/1.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJXFoldView : UIView

@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat itemHeight;

- (void)configurationWithTitles:(NSArray <NSString *>*)titles images:(NSArray <UIImage *>*)images;

@end

@interface YJXTableViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
