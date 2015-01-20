//
//  TaskStore.swift
//  TaskMe
//
//  Created by Tony on 12/28/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

class TaskStore {
    class var sharedInstance: TaskStore {
        struct Static {
            static let instance = TaskStore()
        }
        return Static.instance
    }
    
    var tasks: [Task] = []
    
    func add(task: Task) {
        tasks.append(task)
    }
    
    func replace(task: Task, atIndex index: Int) {
        tasks[index] = task
    }
    
    func get(index: Int) -> Task {
        return tasks[index]
    }
    
    func count() -> Int {
        return tasks.count
    }
    
    func removeTaskAtIndex(index: Int) {
        tasks.removeAtIndex(index)
    }
}
