//
//  AMTitleBarViewController.m
//  AMWindow
//
//  Created by Daria Kovalenko on 2/2/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMTitleBarViewController.h"

@interface AMTitleBarViewController ()

@end

@implementation AMTitleBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)textButtonClicked:(id)sender {
    [self.titleLabel setHidden:!self.titleLabel.hidden];
}

@end
