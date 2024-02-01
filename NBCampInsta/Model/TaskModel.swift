//
//  TaskModel.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/31/24.
//

import Foundation

struct TaskModel {
    var id: UUID
    var title: String
    var createDate: Date
    var modifyDate: Date
    var isCompleted: Bool
}
