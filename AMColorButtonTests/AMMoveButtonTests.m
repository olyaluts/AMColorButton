//
//  AMMoveButtonTests.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/30/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "AMDragButton.h"

@interface AMTestContainer : NSView
@property BOOL isDragged;
@end

@implementation AMTestContainer
- (id)init {
    self = [super init];
    if (self) {
        _isDragged = NO;
    }
    return self;
}

- (void)mouseDragged:(NSEvent *)theEvent {
    self.isDragged = YES;
}

@end

@interface AMMoveButtonTests : XCTestCase {
    AMTestContainer *containerView;
    AMDragButton *dragButton;
    BOOL isClicked;
}

@end

@implementation AMMoveButtonTests

- (void)setUp {
    [super setUp];
    isClicked = NO;
    containerView = [AMTestContainer new];
    
    dragButton = [AMDragButton new];
    [dragButton setAction:@selector(buttonClicked:)];
    [dragButton setTarget:self];
    [containerView addSubview:dragButton];
}

- (void)tearDown {
    [dragButton removeFromSuperview];
    dragButton = nil;
    containerView = nil;
    [super tearDown];
}

- (void)testClick {
    XCTAssertFalse(isClicked);
    [dragButton mouseDown:[NSEvent new]];
    [dragButton mouseUp:[NSEvent new]];
    XCTAssertTrue(isClicked);
}

- (void)testDrag {
    XCTAssertFalse(isClicked);
    XCTAssertFalse(containerView.isDragged);
    [dragButton mouseDown:[NSEvent new]];
    [dragButton mouseDragged:[NSEvent new]];
    [dragButton mouseUp:[NSEvent new]];
    XCTAssertFalse(isClicked);
    XCTAssertTrue(containerView.isDragged);
}

- (IBAction)buttonClicked:(id)sender {
    isClicked = YES;
}

@end
