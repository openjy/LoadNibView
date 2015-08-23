//
//  ViewController.m
//  LoadNibView
//
//  Created by wootidemacbook on 15-6-13.
//  Copyright (c) 2015年 com.jiayu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil];
    UIView *view = [views lastObject];
    
    CGRect rect1,rect2,rect3 ;
    
        rect1 = view.frame;
        rect1.origin.y +=80;
        view.frame = rect1;
        
        [self.view addSubview:view];
    
    
    //View2
    [[NSBundle mainBundle] loadNibNamed:@"View2" owner:self options:nil];
    
        rect2 = self.refrenceView.frame;
        rect2.origin.y = rect1.size.height + rect1.origin.y;
        rect2.size.height = rect1.size.height;
    rect2.size.width = rect1.size.width;
    
        self.refrenceView.frame = rect2;
        
    [self.view addSubview:self.refrenceView];

    
    //View3
    FileOwner *fileOwner = [FileOwner new];
    [[NSBundle mainBundle] loadNibNamed:@"View3" owner:fileOwner options:nil];
    
    rect3 = fileOwner.myView.frame;
    rect3.origin.y = rect2.size.height + rect2.origin.y;
    rect3.size.height = rect1.size.height;
    rect3.size.width = rect1.size.width;
    
    fileOwner.myView.frame = rect3;
    [self.view addSubview:fileOwner.myView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
