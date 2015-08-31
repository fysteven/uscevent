//
//  EventViewController.m
//  uscevent
//
//  Created by Yao Fan on 8/30/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import "EventViewController.h"
#import "EventEngine.h"

@interface EventViewController () <UIScrollViewDelegate>
@property IBOutlet UIScrollView *scrollView;
@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.delegate = self;
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x != 0) {
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureEvent:(NSString *)event_id {
    NSNumber *number = @([event_id integerValue]);
    [self configure:number];
}

- (void)configure:(NSNumber *)event_id {
    EventEngine *engine = [EventEngine new];
    [engine getEvent:event_id completion:^(EventModel *eventModel, NSError *anError) {
        if (eventModel) {
            self.titleLabel.text = eventModel.title;
            self.scheduleLabel.text = eventModel.schedule;
            
            
            UIFont *font = [UIFont systemFontOfSize:17.0];
            NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
            
            NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[eventModel.description1 dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
            
            [attrStr beginEditing];
            [attrStr setAttributes:attrsDictionary range:NSMakeRange(0, [[attrStr string] length])];
            [attrStr endEditing];
            
            self.descriptionLabel.attributedText = attrStr;
            self.locationLabel.text = [self configureLocation:eventModel];
            self.audienceLabel.text = [self getArrayOfStrings:eventModel.audience];
            
        }
    }];
}

- (NSString *)configureLocation:(EventModel *)model {
    NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:1];
    
    [mutableString appendFormat:@"%@\n", model.venue];
    [mutableString appendFormat:@"%@\n", model.campus];
    [mutableString appendFormat:@"%@ %@\n", model.building_code, model.room];
    [mutableString appendFormat:@"%@", model.address];
    
    return [NSString stringWithString:mutableString];
}

- (NSString *)getArrayOfStrings:(NSArray *)array {
    NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:1];
    for (NSString *string in array) {
        if (mutableString.length == 0) {
            [mutableString appendFormat:@"%@", string];
        } else {
            [mutableString appendFormat:@", %@", string];
        }
    }
    return [NSString stringWithString:mutableString];
}

@end
