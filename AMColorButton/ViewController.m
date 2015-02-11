//
//  ViewController.m
//  AMColorButton
//
//  Created by Daria Kovalenko on 1/23/15.
//  Copyright (c) 2015 anadea. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

-(void)awakeFromNib {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"AMTableRowView" bundle:nil];
    NSNib *nibCell = [[NSNib alloc] initWithNibNamed:@"AMTableViewCell" bundle:nil];
    [self.table registerNib:nib forIdentifier:@"cell"];
    [self.table registerNib:nibCell forIdentifier:@"cellContent"];
    [self.table setDataSource:self];
    [self.table setDelegate:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

-(IBAction)makeBordered:(id)sender {
    [self.borderedView setBordered:!self.borderedView.bordered];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 80;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return [tableView makeViewWithIdentifier:@"cellContent" owner:self];
}

-  (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    NSTableRowView  *view = [tableView makeViewWithIdentifier:@"cell" owner: self];
    if (!view) {
        view = [[NSTableRowView alloc] initWithFrame:NSMakeRect(0, 0, tableView.frame.size.width, 180)];
        view.identifier = @"cell";
    }
    return view;
}
@end
