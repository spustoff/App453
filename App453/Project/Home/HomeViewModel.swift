//
//  HomeViewModel.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var portfolios: [PortfolioModel] = []
    @Published var invests: [InvestModel] = []
    
    @Published var isAddPortfolio: Bool = false
    @Published var isAddInvest: Bool = false
    
    @Published var isEdit: Bool = false
    @Published var isChart: Bool = false
    
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("direction") var direction: String = "Up"
    
    @Published var invest_project: String = ""
    @Published var invest_amount: String = ""
    @Published var invest_date: Date = Date()
    
    @Published var project_logo: String = ""
    @Published var project_fullname: String = ""
    @Published var project_shortname: String = ""
    @Published var project_text: String = ""
    @Published var project_currentprice: String = ""
    @Published var project_pricechange: String = ""
    @Published var project_direction: String = "Up"
    
    func addInvest() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InvestModel", into: context) as! InvestModel

        loan.project = invest_project
        loan.amount = Int16(invest_amount) ?? 0
        loan.date = invest_date

        CoreDataStack.shared.saveContext()
    }
    
    func fetchInvests() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InvestModel>(entityName: "InvestModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.invests = result
            
        } catch _ as NSError {
            
            self.invests = []
        }
    }
    
    func addPortfolio() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PortfolioModel", into: context) as! PortfolioModel

        loan.logo = project_logo
        loan.full_name = project_fullname
        loan.short_name = project_shortname
        loan.text = project_text
        loan.price = Int16(project_currentprice) ?? 0
        loan.price_change = Int16(project_pricechange) ?? 0
        loan.direction = project_direction

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPortfolios() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PortfolioModel>(entityName: "PortfolioModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.portfolios = result
            
        } catch _ as NSError {
            
            self.portfolios = []
        }
    }
}
