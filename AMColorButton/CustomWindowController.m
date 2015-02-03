//
//  CustomWindowController.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 2/3/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "CustomWindowController.h"
#import "AMTitleBarViewController.h"

@interface CustomWindowController ()

@end

@implementation CustomWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    AMTitleBarViewController *titleBar = [[AMTitleBarViewController alloc] initWithNibName:@"AMTitleBarViewController" bundle:nil];
    [titleBar setLayoutAttribute:NSLayoutAttributeBottom];
    [titleBar setFullScreenMinHeight:150];
    [self.window addTitlebarAccessoryViewController:titleBar];
}

@end
