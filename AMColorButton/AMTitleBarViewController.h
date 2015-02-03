//
//  AMTitleBarViewController.h
//  AMWindow
//
//  Created by Daria Kovalenko on 2/2/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AMTitleBarViewController : NSTitlebarAccessoryViewController

@property (weak) IBOutlet NSTextField *titleLabel;

- (IBAction)textButtonClicked:(id)sender;
@end
