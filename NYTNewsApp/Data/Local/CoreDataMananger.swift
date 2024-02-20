import CoreData
import Foundation

protocol CoreDataManagerProtocol {
    func saveNew(new:NewsModel)
    func fetchNews() -> [NewsData]
}

class CoreDataManager:CoreDataManagerProtocol {
    static let shared = CoreDataManager()

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NYTNewsApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveNew(new:NewsModel) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsData")
        fetchRequest.predicate = NSPredicate(format: "id == %lld", Int64(new.id))
        do {
            let result = try context.fetch(fetchRequest)
            if result.isEmpty {
                let entity = NSEntityDescription.entity(forEntityName: "NewsData", in: context)!
                let newNew = NSManagedObject(entity: entity, insertInto: context)
                newNew.setValue(Int64(new.id), forKey: "id")
                newNew.setValue(new.title, forKey: "title")
                newNew.setValue(new.category, forKey: "category")
                newNew.setValue(new.date, forKey: "date")
                newNew.setValue(new.byline, forKey: "byline")
                newNew.setValue(new.abstract, forKey: "abstract")
                try context.save()
            }
        } catch {
            print("Error saving or fetching movie: \(error)")
        }
    }

    func fetchNews() -> [NewsData] {
        let fetchRequest = NSFetchRequest<NewsData>(entityName: "NewsData")

        do {
            let results = try context.fetch(fetchRequest)
                return results
            
        } catch let error as NSError {
            print("Could not fetch movies: \(error), \(error.userInfo)")
            return []
        }
    }

}
