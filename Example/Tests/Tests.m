//
//  VehicleModelSelectorTests.m
//  VehicleModelSelectorTests
//
//  Created by 18606563661@163.com on 12/13/2017.
//  Copyright (c) 2017 18606563661@163.com. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

  context(@"will fail", ^{

      it(@"can do maths", ^{
          [[@1 should] equal:@2];
      });

      it(@"can read", ^{
          [[@"number" should] equal:@"string"];
      });
    
      it(@"will wait and fail", ^{
          NSObject *object = [[NSObject alloc] init];
          [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
      });
  });

  context(@"will pass", ^{
    
      it(@"can do maths", ^{
        [[@1 should] beLessThan:@23];
      });
    
      it(@"can read", ^{
          [[@"team" shouldNot] containString:@"I"];
      });  
  });
  
});

SPEC_END

