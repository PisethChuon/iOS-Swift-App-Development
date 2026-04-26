import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.createdAt, ascending: false)],
        animation: .default)
    private var tasks: FetchedResults<TaskItem>
    
    @State private var inputTitle: String = ""
    
    var body: some View {
        VStack {
            
            // Input
            TextField("Enter task...", text: $inputTitle)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            // Add Button
            Button("Add Task") {
                addTask()
            }
            .padding(.bottom)
            
            // List
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title ?? "No title")
                        Spacer()
                        Text(task.category?.name ?? "No category")
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
        }
    }
    
    // MARK: - Add Task
    private func addTask() {
        guard !inputTitle.isEmpty else { return }
        
        let random = Bool.random()
        let categoryName = random ? "Work" : "Personal"
        let category = getOrCreateCategory(name: categoryName)
        
        let newTask = TaskItem(context: viewContext)
        newTask.title = inputTitle
        newTask.createdAt = Date()
        newTask.isDone = false
        newTask.category = category
        
        do {
            try viewContext.save()
            inputTitle = ""
            print("Saved!")
        } catch {
            print("Error saving")
        }
    }
    
    // MARK: - Delete
    private func deleteTasks(offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            print("Error deleting")
        }
    }
    
    // MARK: - Get or Create Category
    private func getOrCreateCategory(name: String) -> Category {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        if let result = try? viewContext.fetch(request),
           let existing = result.first {
            return existing
        }
        
        let newCategory = Category(context: viewContext)
        newCategory.name = name
        return newCategory
    }
}

#Preview {
    ContentView()
}
