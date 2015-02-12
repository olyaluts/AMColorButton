//
//  AMTableRowView.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 2/11/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMTableRowView.h"
#import "AMTableCellView.h"

@implementation AMTableRowView

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    for (int i = 0; i < [self numberOfColumns]; i++) {
        NSView *viewCell = [self viewAtColumn:i];
        if (viewCell && [viewCell isKindOfClass:[AMTableCellView class]]) {
            [(AMTableCellView *)viewCell setHighlighted:selected];
        }
    }
}

- (void)drawRect:(NSRect)dirtyRect {
    NSRect rect = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height);
    [[NSColor colorWithSRGBRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha: 1.0] set];
    NSRectFill(rect);
    NSFrameRect(rect);
}

- (void)setSelectionHighlightStyle:(NSTableViewSelectionHighlightStyle)selectionHighlightStyle {
    [super setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
}

@end
