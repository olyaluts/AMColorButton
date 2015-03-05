//
//  AMBorderSelectableRow.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 3/5/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMBorderSelectableRow.h"
#import "AMTableCellView.h"

@implementation AMBorderSelectableRow

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    for (int i = 0; i < [self numberOfColumns]; i++) {
        [self viewAtColumn:i];
    }
}

-(id)viewAtColumn:(NSInteger)column {
    id viewCell = [super viewAtColumn:column];
    if (viewCell && [viewCell isKindOfClass:[AMTableCellView class]]) {
        [(AMTableCellView *)viewCell setHighlighted:self.selected];
    }
    return viewCell;
}

- (void)setSelectionHighlightStyle:(NSTableViewSelectionHighlightStyle)selectionHighlightStyle {
    [super setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
}
@end
