//
//  CoreDataDatabase.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/14/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import CoreData
import UIKit
class CoreDataDatabase{
    
    private var context:NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    //save data to the database
    func saveTask(news:Article){
        let entity = NSEntityDescription.entity(forEntityName: "News", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! News
        taskObject.author = news.author
        taskObject.title = news.title
        taskObject.content = news.content
        taskObject.descriptions = news.description
        taskObject.publishedAt = news.publishedAt
        taskObject.urlToImage = news.urlToImage
        taskObject.url = news.url
        do{
            try context.save()
            print("Data successfully saved to the CoreData")
        }catch{
            print(error.localizedDescription)
        }
    }
    //fetch data from the database

    func fetchRequestData(completion: @escaping ([Article]?) -> Void){
        let fetchRequest:NSFetchRequest<News> = News.fetchRequest()
        do{
            completion(transmissonItemsToTheNewModel(news: try context.fetch(fetchRequest)))
            print("Data successfully fetched")
        }catch{
            print(error.localizedDescription)
        }
    }
    //delete data from database
    func deleteTask(news:Article){
        let entity = NSEntityDescription.entity(forEntityName: "News", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! News
        taskObject.author = news.author
        taskObject.title = news.title
        taskObject.content = news.content
        taskObject.descriptions = news.description
        taskObject.publishedAt = news.publishedAt
        taskObject.urlToImage = news.urlToImage
        taskObject.url = news.url
        context.delete(taskObject)
        do {
            try context.save()
            print("Data successfully deleted from CoreData")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllRecords() {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("Successfully deleted all records")
        } catch {
            print ("There was an error")
        }
    }

    //transmisson
    func transmissonItemsToTheNewModel(news:[News]) -> [Article]{
        var article = [Article]()
        news.forEach { (items) in
            article.append(Article(author: items.author, title: items.title, description: items.descriptions, urlToImage: items.urlToImage, url: items.url, publishedAt: items.publishedAt, content: items.content))
        }
        return article
    }
}
