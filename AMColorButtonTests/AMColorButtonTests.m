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
}

@end

@implementation AMColorButtonTests

- (void)setUp {
    [super setUp];
    button = [[AMColorButton alloc] init];
    [button setTitle:@"Button title"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    button = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTitleOffColor {
    [button setState:NSOffState];
    
    NSColor *color = [NSColor colorWithCalibratedRed:20./255. green:30./255. blue:40./255. alpha:1.0];
    [button setTitleColor:color];
    NSColor *selectedColor = [NSColor colorWithCalibratedRed:120./255. green:130./255. blue:140./255. alpha:1.0];
    [button setTitleSelectedColor:selectedColor];
    
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    XCTAssertTrue([attr isEqualTo:selectedColor]);
}

- (void)testTitleOffColorWithoutSelectedColor {
    [button setState:NSOffState];
    
    NSColor *color = [NSColor colorWithCalibratedRed:20./255. green:30./255. blue:40./255. alpha:1.0];
    [button setTitleColor:color];
    
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    XCTAssertTrue([attr isEqualTo:color]);
}

- (void)testTitleColor {
    [button setState:NSOnState];
    
    NSColor *color = [NSColor colorWithCalibratedRed:20./255. green:30./255. blue:40./255. alpha:1.0];
    [button setTitleColor:color];
    NSColor *selectedColor = [NSColor colorWithCalibratedRed:120./255. green:130./255. blue:140./255. alpha:1.0];
    [button setTitleSelectedColor:selectedColor];
    
    NSRange range = NSMakeRange(0, button.title.length);
    id attr = [[button attributedTitle] attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
    
    XCTAssertTrue([attr isEqualTo:color]);
}

@end
