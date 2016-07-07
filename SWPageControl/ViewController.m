//
//  ViewController.m
//  SWPageControl
//
//  Created by 石文文 on 16/7/7.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "ViewController.h"
#import "SWPageControl.h"
@interface ViewController ()<SWPageControlDelegate>
@property (weak, nonatomic) IBOutlet SWPageControl *swPageControl;
@property (weak, nonatomic) IBOutlet SWPageControl *swPageControl2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.swPageControl.numberOfPages = 10;
    self.swPageControl.currentPage = 2;
    self.swPageControl.pageIndicatorImage = [UIImage imageNamed:@"Oval 2 Copy"];
    
    self.swPageControl.currentPageIndicatorimage = [UIImage imageNamed:@"小圆圆"];
    
    
    self.swPageControl.backgroundColor = [UIColor whiteColor];
    self.swPageControl.delegate = self;
    
    self.swPageControl2.numberOfPages = 8;
    self.swPageControl2.currentPage = 0;
    
    self.swPageControl2.backgroundColor = [UIColor whiteColor];
    
    self.swPageControl2.currentPageIndicatorTintColor = [UIColor blueColor];
    
    self.swPageControl2.pageIndicatorTintColor = [UIColor yellowColor];
    self.swPageControl.delegate = self;
    
}
-(void)swPageControl:(SWPageControl *)swPageControl didSelectPageIndicatorAtIndex:(NSInteger)index{
    
    
    NSLog(@"点击了%d",index);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
