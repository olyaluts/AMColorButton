//
//  AMDashBorderedView.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/29/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMDashBorderedView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AMDashBorderedView

#pragma mark - Initializers
- (id)init {
    self = [super init];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setDefaults];
    }
    return self;
}

#pragma mark - Set Values
-(void)setDefaults {
    self.backgroundColor = [NSColor colorWithSRGBRed:229.0/255.0 green:232.0/255.0 blue:238.0/255.0 alpha:1.0];
    self.borderColor = [NSColor colorWithSRGBRed:187.0/255.0 green: 197.0/255.0 blue: 211.0/255.0 alpha: 1.0];
    self.borderWidth = 2.;
    self.dotLineLength = 10.;
    self.dotSpaceLength = 10.;
    self.borderOffset = 15.;
    self.cornerRadius = 10.;
    self.bordered = NO;
}

-(void)setBordered:(BOOL)bordered {
    _bordered = bordered;
    [self setNeedsDisplay:YES];
}

#pragma mark - Draw view
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (dirtyRect.size.height == self.bounds.size.height && dirtyRect.size.width == self.bounds.size.width) {
        [self.backgroundColor set];
        NSRectFill(dirtyRect);
        if(self.bordered) {
            [self drawBorder:dirtyRect];
        }
    }
}

- (void)drawBorder:(NSRect)dirtyRect {
    if (((dirtyRect.size.width > self.borderOffset*2) && dirtyRect.size.height > self.borderOffset*2)) {
        NSRect borderRect = NSMakeRect(dirtyRect.origin.x + self.borderOffset,
                                       dirtyRect.origin.y + self.borderOffset,
                                       dirtyRect.size.width - self.borderOffset * 2,
                                       dirtyRect.size.height - self.borderOffset *2);
        
        [self.borderColor set];
        NSBezierPath *borderPath = [NSBezierPath bezierPath];
        [borderPath appendBezierPathWithRoundedRect:borderRect xRadius:self.cornerRadius yRadius:self.cornerRadius];
        CGFloat pattern[2];
        pattern[0]= self.dotLineLength;
        pattern[1]= self.dotSpaceLength;
        [borderPath setLineDash:pattern count:1. phase:0.];
        [borderPath setLineWidth:self.borderWidth];
        [borderPath stroke];
    }
}



@end
