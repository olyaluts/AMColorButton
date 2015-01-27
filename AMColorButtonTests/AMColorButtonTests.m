//
//  AMColorButtonTests.m
//  AMColorButtonTests
//
//  Created by Daria Kovalenko on 1/23/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "AMColorButton.h"

@interface AMColorButtonTests : XCTestCase {
    AMColorButton *button;
    NSColor *color;
    NSColor *selectedColor;
    NSColor *highlightedColor;
}

@end

@implementation AMColorButtonTests

- (void)setUp {
    [super setUp];
    color = [NSColor colorWithCalibratedRed:20./255. green:30./255. blue:40./255. alpha:1.0];
    selectedColor = [NSColor colorWithCalibratedRed:120./255. green:130./255. blue:140./255. alpha:1.0];
    highlightedColor = [NSColor colorWithCalibratedRed:0.5 green:0. blue:0.5 alpha:1.0];
    
    button = [[AMColorButton alloc] init];
    [button setTitle:@"Button title"];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    button = nil;
    color = nil;
    selectedColor = nil;
    highlightedColor = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTitleOffColor {
    [button setState:NSOffState];
    
    [button setTitleColor:color];
    
    [button setTitleSelectedColor:selectedColor];
    
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    XCTAssertTrue([attr isEqualTo:color]);
}

- (void)testTitleColor {
    [button setState:NSOnState];
    [button setTitleColor:color];
    [button setTitleSelectedColor:selectedColor];
    
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    
    XCTAssertTrue([attr isEqualTo:selectedColor]);
}

- (void)testMoveInOut {
    [button setState:NSOnState];
    
    [button setTitleColor:color];
    [button setTitleSelectedColor:selectedColor];
    [button setTitleHighlightedColor:highlightedColor];
    
    [button mouseEntered:[NSEvent new]];
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    
    XCTAssertTrue([attr isEqualTo:highlightedColor]);
    
    [button mouseExited:[NSEvent new]];
    
    attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    XCTAssertTrue([attr isEqualTo:selectedColor]);
}

- (void)testMoveInOutOff {
    [button setState:NSOffState];
    
    [button setTitleColor:color];
    [button setTitleSelectedColor:selectedColor];
    [button setTitleHighlightedColor:highlightedColor];
    
    [button mouseEntered:[NSEvent new]];
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    
    XCTAssertTrue([attr isEqualTo:highlightedColor]);
    
    [button mouseExited:[NSEvent new]];
    
    attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    XCTAssertTrue([attr isEqualTo:color]);
}

- (void)testMoveInOutBackground {
    [button setState:NSOnState];
    
    [button setBackgroundColor:color];
    [button setSelectedBgColor:selectedColor];
    [button setHighlightedBgColor:highlightedColor];
    
    [button mouseEntered:[NSEvent new]];
    id attr = [button.cell backgroundColor];
    
    XCTAssertTrue([attr isEqualTo:highlightedColor]);
    
    [button mouseExited:[NSEvent new]];
    
    attr = [button.cell backgroundColor];
    XCTAssertTrue([attr isEqualTo:selectedColor]);
}

- (void)testMoveInOutOffBackground {
    [button setState:NSOffState];
    
    [button setBackgroundColor:color];
    [button setSelectedBgColor:selectedColor];
    [button setHighlightedBgColor:highlightedColor];
    
    [button mouseEntered:[NSEvent new]];
    id attr = [button.cell backgroundColor];
    
    XCTAssertTrue([attr isEqualTo:highlightedColor]);
    
    [button mouseExited:[NSEvent new]];
    
    attr = [button.cell backgroundColor];
    XCTAssertTrue([attr isEqualTo:color]);
}
@end
