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

-(void)setDefaults {
    self.backgroundColor = [NSColor colorWithSRGBRed:229.0/255.0 green:232.0/255.0 blue:238.0/255.0 alpha:1.0];
    self.borderColor = [NSColor colorWithSRGBRed:187.0/255.0 green: 197.0/255.0 blue: 211.0/255.0 alpha: 1.0];
    self.borderWidth = 2.;
    self.dotLineLength = 10.;
    self.dotSpaceLength = 10.;
    self.borderOffset = 15.;
    self.cornerRadius = 10.;
}

- (void)drawBorder:(NSRect)dirtyRect {
    NSRect borderRect = ((dirtyRect.size.width > self.borderOffset*2) && dirtyRect.size.height > self.borderOffset*2) ?
    NSMakeRect(dirtyRect.origin.x + self.borderOffset, dirtyRect.origin.y + self.borderOffset, dirtyRect.size.width - self.borderOffset * 2,
               dirtyRect.size.height - self.borderOffset *2) : dirtyRect;
    
    [self.borderColor set];
    NSBezierPath* thePath = [NSBezierPath bezierPath];
    [thePath appendBezierPathWithRoundedRect:borderRect xRadius:self.cornerRadius yRadius:self.cornerRadius];
    CGFloat array[2];
    array[0]= self.dotLineLength;
    array[1]= self.dotSpaceLength;
    [thePath setLineDash:array count:1. phase:0.];
    [thePath setLineWidth:self.borderWidth];
    [thePath stroke];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.backgroundColor set];
    NSRectFill(dirtyRect);

    if(self.bordered){
        [self drawBorder:dirtyRect];
    }
}

-(void)setBordered:(BOOL)bordered {
    _bordered = bordered;
    [self setNeedsDisplay:YES];
}

@end
