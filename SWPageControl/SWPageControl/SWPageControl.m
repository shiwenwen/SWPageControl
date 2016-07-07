//
//  SWPageControl.m
//  SWPageController
//
//  Created by 石文文 on 16/5/24.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "SWPageControl.h"

@interface SWPageControl(){
    
    
    CGSize _pageIndicatorSize;
    
    
}

@end

@implementation SWPageControl

- (instancetype)initWithFrame:(CGRect)frame PageIndicatorSize:(CGSize)size
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _pageIndicatorSize = size;
        
    }
    return self;
}


-(void)setNumberOfPages:(NSInteger)numberOfPages{
    
    _numberOfPages = numberOfPages;
        
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    if (_pageIndicatorSize.width == 0&&_pageIndicatorSize.height == 0) {
        
        _pageIndicatorSize = CGSizeMake(10, 10);
        
    }
    
    CGFloat left = (self.frame.size.width -( _numberOfPages * 2 - 1 )*_pageIndicatorSize.width)/2;
    CGFloat top = (self.frame.size.height - _pageIndicatorSize.height)/2;
    
    for (int i = 0; i< _numberOfPages; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(clickPageIndicator:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(left+i*2*_pageIndicatorSize.width , top, _pageIndicatorSize.width, _pageIndicatorSize.height);
        [self addSubview:button];
        button.tag = i;
        
        
        if (_pageIndicatorImage) {
          [button setImage:_pageIndicatorImage forState:UIControlStateNormal];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 0;
        }
        if (_pageIndicatorTintColor) {
            
          [button setImage:[self createImageWithColor:_pageIndicatorTintColor size:button.frame.size] forState:UIControlStateNormal];
          
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = button.frame.size.width > button.frame.size.height?button.frame.size.width/2.0:button.frame.size.height/2.0;
        }
        
        if (_currentPageIndicatorimage) {
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 0;
         [button setImage:_currentPageIndicatorimage forState:UIControlStateSelected];   
        }
        
        if (_currentPageIndicatorTintColor) {
            
            [button setImage:[self createImageWithColor:_currentPageIndicatorTintColor size:button.frame.size] forState:UIControlStateSelected];
            
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = button.frame.size.width > button.frame.size.height?button.frame.size.width/2.0:button.frame.size.height/2.0;
        }
        
    }
    
}

-(void)setPageIndicatorImage:(UIImage *)pageIndicatorImage{
    
    _pageIndicatorImage = pageIndicatorImage;
    
    _pageIndicatorTintColor = nil;
    
    for (UIView *view in self.subviews) {
        
        
        UIButton *button = (UIButton *)view;
        [button setImage:_pageIndicatorImage forState:UIControlStateNormal];
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 0;
    }
    
    
}

-(void)setCurrentPageIndicatorimage:(UIImage *)currentPageIndicatorimage{
    _currentPageIndicatorimage = currentPageIndicatorimage;
    _currentPageIndicatorTintColor = nil;
    
    for (UIView *view in self.subviews) {
        
        
        UIButton *button = (UIButton *)view;
        [button setImage:_currentPageIndicatorimage forState:UIControlStateSelected];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 0;
        
    }
}

-(void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    
    for (UIView *view in self.subviews) {
        
        
        UIButton *button = (UIButton *)view;
        [button setImage:[self createImageWithColor:_pageIndicatorTintColor size:button.frame.size] forState:UIControlStateNormal];
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = button.frame.size.width > button.frame.size.height?button.frame.size.width/2.0:button.frame.size.height/2.0;

        
        
    }
    
}
-(void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{
    
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    
    
    for (UIView *view in self.subviews) {
        
        
        UIButton *button = (UIButton *)view;
        [button setImage:[self createImageWithColor:_currentPageIndicatorTintColor size:button.frame.size] forState:UIControlStateSelected];
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = button.frame.size.width > button.frame.size.height?button.frame.size.width/2.0:button.frame.size.height/2.0;
    }

    
    
}

-(void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    
    
    for (UIView *view in self.subviews) {
        
        
        UIButton *button = (UIButton *)view;
        if (button.tag == currentPage) {
            
            button.selected = YES;
        }else{
            button.selected = NO;
        }
        
    }
    
}
-(void)clickPageIndicator:(UIButton *)button{
    
    
    
    [self setCurrentPage:button.tag];
    
    
    if ([self.delegate respondsToSelector:@selector(swPageControl:didSelectPageIndicatorAtIndex:)]) {
        
        [self.delegate swPageControl:self didSelectPageIndicatorAtIndex:button.tag];
        
    }
    for (UIView *view in self.subviews) {
        
        
        UIButton *but = (UIButton *)view;
        if (but.tag != button.tag) {
            
            if ([self.delegate respondsToSelector:@selector(swPageControl:didDeSelectPageIndicatorAtIndex:)]) {
                
                [self.delegate swPageControl:self didDeSelectPageIndicatorAtIndex:button.tag];
                
            }
            
        }
        
    }
    
    
    
}
- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;
{
    CGRect rect = CGRectZero;
    rect.size = size;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
