//
//  ViewController.m
//  DynamicAppIconDemo
//
//  Created by zhangpeng on 2018/7/10.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "ViewController.h"
#import "FSAppIconManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *name = [FSAppIconManager getCurrentAppIconName];
    NSLog(@"name: %@", name);
}


- (IBAction)changeAppIcon:(id)sender {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
