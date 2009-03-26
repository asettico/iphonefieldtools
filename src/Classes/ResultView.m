// Copyright 2009 Brad Sokol
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  ResultView.m
//  FieldTools
//
//  Created by Brad on 2009/03/19.
//  Copyright 2009 Brad Sokol. All rights reserved.
//

#import "ResultView.h"

#import "DistanceFormatter.h"
#import "UserDefaults.h"

@interface ResultView (Private)

- (NSString*)formatDistance:(CGFloat)distance;

@end

@implementation ResultView

- (id)initWithCoder:(NSCoder*)decoder
{
	if (nil == [super initWithCoder:decoder])
	{
		return nil;
	}
	
	distanceFormatter = [[DistanceFormatter alloc] init];
	firstDraw = YES;
	
    return self;
}

- (void)drawRect:(CGRect)rect 
{
	if (firstDraw)
	{
		// Adjust the height of the text display to show larger font
		CGRect r = [largeText frame];
		r.size.height *= 1.75f;
		[largeText setFrame:r];

		firstDraw = NO;
	}
	
	if (displayRange)
	{
		leftNumber.hidden = NO;
		rightNumber.hidden = NO;
		largeText.text = @"";
	}
	else
	{
		leftNumber.hidden = YES;
		rightNumber.hidden = YES;
		
		largeText.text = [distanceFormatter stringForObjectValue:[NSNumber numberWithFloat:nearDistance]];
	}
}

- (void)setResult:(CGFloat)distance
{
	displayRange = NO;
	nearDistance = distance;
	[self setNeedsDisplay];
}

- (void)setResultNear:(CGFloat)near far:(CGFloat)far
{
	displayRange = YES;
	nearDistance = near;
	farDistance = far;
	[self setNeedsDisplay];
}

- (void)dealloc 
{
	[distanceFormatter release];
	
    [super dealloc];
}

@end
