//
//  ViewController.h
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/23/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AMDashBorderedView.h"

@interface ViewController : NSViewController

@property (weak, nonatomic) IBOutlet AMDashBorderedView *borderedView;

-(IBAction)makeBordered:(id)sender;

@end

