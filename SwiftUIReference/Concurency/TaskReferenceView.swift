//
//  TaskReferenceView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 1/31/25.
//

import SwiftUI

final class TaskManagerSample {
    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
    
    func taskOne() {
        print("Task one started")
        // Simulating some work with sleep
        sleep(5)
        print("Task one Finished")
    }
    
    func taskTwo() {
        print("Task Two started")
        // Simulating some work with sleep
        sleep(1)
        print("Task Two finished")
    }
    
    func taskThree() {
        print("Task Three started")
        // Simulating some work with sleep
        sleep(3)
        print("Task Three finished")
    }
    
    // Method to call the tasks on a serialized queue
    func executeTasks() {
        // Dispatch each task asynchronously to the serial queue
        serialQueue.async {
            self.taskOne()
        }
        
        serialQueue.async {
            self.taskTwo()
        }
        
        serialQueue.async {
            self.taskThree()
        }
    }
    
}

struct TaskReferenceView: View {
    let manager = TaskManagerSample()
        
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button {
            manager.executeTasks()
            Task {
//                print("shmerda")
            }
        } label: {
            Text("Execute")
                .frame(width: 300, height: 60)
                .font(.largeTitle)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            
        }
    }
}

#Preview {
    TaskReferenceView()
}
