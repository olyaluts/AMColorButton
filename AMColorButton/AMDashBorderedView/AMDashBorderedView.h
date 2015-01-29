//
//  AMDashBorderedView.h
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/29/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AMDashBorderedView : NSView

@property IBInspectable CGFloat cornerRadius;

@property (nonatomic) IBInspectable BOOL bordered;
@property (nonatomic) IBInspectable CGFloat dotLineLength;
@property (nonatomic) IBInspectable CGFloat dotSpaceLength;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable NSColor *borderColor;
@property (nonatomic) IBInspectable NSColor *backgroundColor;
@property (nonatomic) IBInspectable CGFloat borderOffset;

@end
