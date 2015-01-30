//
//  AMMoveButton.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/30/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMDragButton.h"
@interface AMDragButton() {
    BOOL shouldClick;
}
@end

@implementation AMDragButton

#pragma mark - Mouse events
- (void)mouseDown:(NSEvent *)theEvent {
    [self.cell setHighlighted:YES];
    shouldClick = YES;
}

- (void)mouseDragged:(NSEvent *)theEvent {
    [self.superview mouseDragged:theEvent];
    shouldClick = NO;
}

- (void)mouseUp:(NSEvent *)theEvent {
    [self.cell setHighlighted:NO];
    if (shouldClick) {
        if (self.target && [self.target respondsToSelector:self.action]) {
            IMP imp = [self.target methodForSelector:self.action];
            void (*func)(id, SEL, id) = (void *)imp;
            func(self.target, self.action, self);
        }
    }
}

@end
