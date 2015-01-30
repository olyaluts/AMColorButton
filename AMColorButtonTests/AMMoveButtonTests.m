//
//  AMMoveButtonTests.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/30/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "AMMoveButton.h"

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
    AMMoveButton *moveButton;
    BOOL isClicked;
}

@end

@implementation AMMoveButtonTests

- (void)setUp {
    [super setUp];
    isClicked = NO;
    containerView = [AMTestContainer new];
    
    moveButton = [AMMoveButton new];
    [moveButton setAction:@selector(buttonClicked:)];
    [moveButton setTarget:self];
    [containerView addSubview:moveButton];
}

- (void)tearDown {
    [moveButton removeFromSuperview];
    moveButton = nil;
    containerView = nil;
    [super tearDown];
}

- (void)testClick {
    XCTAssertFalse(isClicked);
    [moveButton mouseDown:[NSEvent new]];
    [moveButton mouseUp:[NSEvent new]];
    XCTAssertTrue(isClicked);
}

- (void)testDrag {
    XCTAssertFalse(isClicked);
    XCTAssertFalse(containerView.isDragged);
    [moveButton mouseDown:[NSEvent new]];
    [moveButton mouseDragged:[NSEvent new]];
    [moveButton mouseUp:[NSEvent new]];
    XCTAssertFalse(isClicked);
    XCTAssertTrue(containerView.isDragged);
}

- (IBAction)buttonClicked:(id)sender {
    isClicked = YES;
}

@end
