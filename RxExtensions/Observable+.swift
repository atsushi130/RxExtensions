//
//  Observable+.swift
//  RxExtensions
//
//  Created by Atsushi Miyake on 2019/01/16.
//  Copyright © 2019年 Atsushi Miyake. All rights reserved.
//

import RxSwift
import RxCocoa

public extension Observable {
    
    public var discarded: Observable<Void> {
        return self.fill(())
    }
    
    public func fill<T>( _ value: T) -> Observable<T> {
        return self.map { _ in value }
    }
    
    public func asDriverIgonringError() -> Driver<Element> {
        return self.asDriver(onErrorDriveWith: .empty())
    }
    
    public func sampleLatestFrom<T>(_ sampler: Observable<T>) -> Observable<T> {
        return self.sample(sampler).withLatestFrom(sampler)
    }
}
