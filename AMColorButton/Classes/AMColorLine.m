//
//  AMColorLine.m
//  AMColorButton
//
//  Created by Olga Lutsyk on 2/4/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "AMColorLine.h"

@implementation AMColorLine

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
- (void)awakeFromNib {
    [self setupLine];
}

- (void)setDefaults {
    self.backgroundColor = [NSColor grayColor];
    self.lineWidth = 1.;
}

- (void)setupLine {
    [self setBoxType:NSBoxCustom];
    [self setBorderType:NSLineBorder];
    [self setBorderWidth:self.lineWidth];
    [self setBorderColor:self.backgroundColor];
}



@end
