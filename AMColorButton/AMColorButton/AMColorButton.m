//
//  AMColorButton.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/23/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMColorButton.h"

@implementation AMColorButton

-(void)awakeFromNib {
    [self addTrackingRect:NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height) owner:self userData:nil assumeInside:YES];
    
    [self addObserver:self
           forKeyPath:@"cell.state"
              options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
              context:NULL];
    [self setTextColorWithState:self.state];
    [self setBackgroundColorWithState:self.state];
}

#pragma mark - Mouse events
- (void)mouseDown:(NSEvent *)theEvent {
    [super mouseDown:theEvent];
}

- (void)mouseUp:(NSEvent *)theEvent {
    [super mouseUp:theEvent];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    if (self.titleHighlightedColor) {
        [self setColor:self.titleHighlightedColor];
    }
    if (self.highlightedBgColor) {
        [self.cell setBackgroundColor: self.highlightedBgColor];
    }
    [super mouseEntered:theEvent];
}

- (void)mouseExited:(NSEvent *)theEvent {
    [self setTextColorWithState:self.state];
    [self setBackgroundColorWithState:self.state];
    [super mouseExited:theEvent];
}

#pragma mark - Setters
-(void)setTitle:(NSString *)title {
    [super setTitle:title];
    if (self.titleColor != nil) {
        [self setTextColorWithState:self.state];
    }
}

- (void)setTitleColor:(NSColor *)titleColor {
    _titleColor = titleColor;
    if (titleColor != nil) {
        [self setTextColorWithState:self.state];
    }
}

- (void)setTitleHighlightedColor:(NSColor *)titleHighlightedColor {
    _titleHighlightedColor = titleHighlightedColor;
    if (titleHighlightedColor != nil) {
        [self setTextColorWithState:self.state];
    }
}

- (void)setTitleSelectedColor:(NSColor *)titleSelectedColor {
    _titleSelectedColor = titleSelectedColor;
    if (titleSelectedColor) {
        [self setTextColorWithState:self.state];
    }
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    if (backgroundColor) {
        [self setBackgroundColorWithState:self.state];
    }
}

- (void)setHighlightedBgColor:(NSColor *)highlightedBgColor {
    _highlightedBgColor = highlightedBgColor;
    if (highlightedBgColor) {
        [self setBackgroundColorWithState:self.state];
    }
}

- (void)setSelectedBgColor:(NSColor *)selectedBgColor {
    _selectedBgColor = selectedBgColor;
    if (selectedBgColor) {
        [self setBackgroundColorWithState:self.state];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setTextColorWithState:[change[@"new"] integerValue]];
    [self setBackgroundColorWithState:[change[@"new"] integerValue]];
}

-(void)setTextColorWithState:(NSCellStateValue)stateValue {
    switch (stateValue) {
        case NSOnState:
            if (self.titleSelectedColor != nil) {
                [self setColor:self.titleSelectedColor];
                return;
            }
        case NSOffState:
        default:
            if (self.titleColor != nil) {
                [self setColor:self.titleColor];
                return;
            }
            else
                [self setColor:[NSColor controlTextColor]];
            break;
    }
}

-(void)setBackgroundColorWithState:(NSCellStateValue)stateValue {
    switch (stateValue) {
        case NSOnState:
            if (self.selectedBgColor) {
                [self.cell setBackgroundColor: self.selectedBgColor];
                return;
            }
        case NSOffState:
        default:
            if (self.backgroundColor) {
                [self.cell setBackgroundColor: self.backgroundColor];
                return;
            }
            else
                [self.cell setBackgroundColor:[NSColor controlColor]];
            break;
    }
}

-(void)setColor:(NSColor *)color {
    if (self.title.length > 0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.title.length)];
        
        [self setAttributedTitle:attrTitle];
    }
}
@end
