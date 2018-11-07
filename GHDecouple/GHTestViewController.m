//
//  GHTestViewController.m
//  GHDecouple
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHTestViewController.h"

@interface GHTestViewController ()

@end

@implementation GHTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"大力哥有点可爱";

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(testViewController:testString:indexPath:)]) {
        [self.delegate testViewController:self testString:@"呵呵" indexPath:self.indexPath];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    NSLog(@"释放了");
}

@end
