//
//  AMColorButton.h
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/23/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AMColorButton : NSButton

@property (strong, nonatomic) IBInspectable NSColor *titleColor;
@property (strong, nonatomic) IBInspectable NSColor *titleHighlightedColor;
@property (strong, nonatomic) IBInspectable NSColor *titleSelectedColor;

@property (strong, nonatomic) IBInspectable NSColor *backgroundColor;
@property (strong, nonatomic) IBInspectable NSColor *highlightedBgColor;
@property (strong, nonatomic) IBInspectable NSColor *selectedBgColor;

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end
