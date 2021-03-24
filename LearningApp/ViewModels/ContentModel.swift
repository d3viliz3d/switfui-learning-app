//
//  ContentModel.swift
//  LearningApp
//
//  Created by Cristian Guerra on 23/3/2564 BE.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    @Published var currentModule: Module?
    @Published var currentLesson: Lesson?
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        // Parse modules data
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let data = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
            
            do {
                
                let moduleData = try decoder.decode([Module].self, from: data)
                
                self.modules = moduleData
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
        // Parse style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let data = try Data(contentsOf: styleUrl!)
            
            self.styleData = data
            
        } catch {
            print(error)
        }
    }
 
    func beginModule(_ moduleId:Int) {
        
        for module in modules {
            if module.id == moduleId {
                currentModuleIndex = module.id
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
        
    }
    
    func beginLesson(_ lessonId:Int) {
        
        if lessonId < currentModule!.content.lessons.count {
            currentLessonIndex = lessonId
        }
        else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
}
