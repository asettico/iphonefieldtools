// Copyright 2011 Brad Sokol
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
//  LinearSubjectDistanceSliderPolicy.m
//  FieldTools
//
//  Created by Brad Sokol on 2011-12-04.
//  Copyright (c) 2011 by Brad Sokol. All rights reserved.
//

#import "LinearSubjectDistanceSliderPolicy.h"

@implementation LinearSubjectDistanceSliderPolicy

- (float)distanceForSliderValue:(float)value
{
	return value;
}

- (float)sliderMaximum
{
    return [[self subjectDistanceRangePolicy] maximumDistance];
}

- (float)sliderMinimum
{
    return [[self subjectDistanceRangePolicy] minimumDistance];
}

- (float)sliderValueForDistance:(float)distance
{
	return distance;
}

@end
