//
//  SWPageControl.h
//  SWPageController
//
//  Created by 石文文 on 16/5/24.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWPageControl;
@protocol SWPageControlDelegate <NSObject>
@optional
/**
 *  点击PageIndicator的代理
 *  @param swPageControl 当前swPageControl
 *  @param index 当前选中的Index
 */
-(void)swPageControl:( SWPageControl * _Nullable )swPageControl didSelectPageIndicatorAtIndex:(NSInteger)index;
/**
 *  除了点击的之外PageIndicator的代理
 *  @param swPageControl 当前swPageControl
 *  @param index 当前选中的Index
 */
-(void)swPageControl:( SWPageControl * _Nullable )swPageControl didDeSelectPageIndicatorAtIndex:(NSInteger)index;

@end

@interface SWPageControl : UIView

- (nonnull instancetype)initWithFrame:(CGRect)frame PageIndicatorSize:(CGSize)size;

/**
 *  总page数
 */
@property(nonatomic) NSInteger numberOfPages;          // default is 0
/**
 *  当前page的位置
 */
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1
/**
 *  所有的Indicator的颜色 非当前的
 */
@property(nullable, nonatomic,strong) UIColor *pageIndicatorTintColor;
/**
 *  当前的Indicator的颜色
 */
@property(nullable, nonatomic,strong) UIColor *currentPageIndicatorTintColor;

/**
 *  所有的的Indicator的图片 非当前的
 */
@property(nullable, nonatomic,strong) UIImage *pageIndicatorImage;
/**
 *  当前的Indicator的图片
 */
@property(nullable, nonatomic,strong) UIImage *currentPageIndicatorimage;

/**
 *  代理对象
 */
@property (nonatomic,weak,nullable)id <SWPageControlDelegate> delegate;
@end
