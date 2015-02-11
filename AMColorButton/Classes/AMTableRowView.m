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

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if ([self numberOfColumns] > 0) {
        NSView *viewCell = [self viewAtColumn:0];
        if (viewCell && [viewCell isKindOfClass:[AMTableCellView class]]) {
            [(AMTableCellView *)viewCell setHighlighted:selected];
        }
    }
}

- (void)setSelectionHighlightStyle:(NSTableViewSelectionHighlightStyle)selectionHighlightStyle {
    [super setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
}

@end
