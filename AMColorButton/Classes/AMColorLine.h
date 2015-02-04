//
//  AMColorLine.h
//  AMColorButton
//
//  Created by Olga Lutsyk on 2/4/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AMColorLine : NSBox

@property (strong, nonatomic) IBInspectable NSColor *backgroundColor;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@end
