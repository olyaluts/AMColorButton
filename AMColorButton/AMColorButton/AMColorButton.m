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
    [self.cell setBackgroundColor: self.backgroundColor];
}

#pragma mark - Mouse events
- (void)mouseDown:(NSEvent *)theEvent {
    [super mouseDown:theEvent];
}

- (void)mouseUp:(NSEvent *)theEvent {
    [super mouseUp:theEvent];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    if (self.titleHighlightedColor != nil) {
        [self setColor:self.titleHighlightedColor];
    }
    [super mouseEntered:theEvent];
}

- (void)mouseExited:(NSEvent *)theEvent {
    if (self.titleColor != nil) {
        [self setTextColorWithState:self.state];
    }
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTextColorWithState:[change[@"new"] integerValue]];
}

-(void)setTextColorWithState:(NSCellStateValue)stateValue {
    switch (stateValue) {
        case NSOffState:
            if (self.titleSelectedColor != nil) {
                [self setColor:self.titleSelectedColor];
                return;
            }
        case NSOnState:
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

-(void)setColor:(NSColor *)color {
    if (self.title.length > 0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.title.length)];
        
        [self setAttributedTitle:attrTitle];
    }
}
@end
