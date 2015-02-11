//
//  AMTableCellView.h
//  AMColorButton
//
//  Created by Daria Kovalenko on 2/11/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AMTableCellView : NSTableCellView

@property (strong, nonatomic) IBInspectable NSColor *backgroundColor;
@property (strong, nonatomic) IBInspectable NSColor *borderColor;
@property (strong, nonatomic) IBInspectable NSColor *borderHighlightedColor;

@property (nonatomic) BOOL highlighted;

@end
