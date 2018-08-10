// Для отображения списка товаров

import UIKit

class ProductsListTableViewController: UITableViewController, TrackableMixin {
    
    var productList = [Product]()
    var requestFactory: RequestFactory?
    var request: ProductStoreRequest?
    let userDefaults = UserDefaults.standard
    
    // Временная константа для заглушки
    let number = 1
    
    override func viewDidLoad() {
        
        requestOnServer(page: number, idCategory: number)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        track(.openProductList())
    }
    
    
    // MARK: - запрос на сервер
    
    func requestOnServer(page: Int, idCategory: Int) {
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeProductStoreRequestFactory() as? ProductStoreRequest
        request?.getAllGoods(page: page, idCategory: idCategory, completionHandler: { (response) in
            
            guard let list = response.result.value?.products else { return }
            self.productList = list
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    
    // MARK: - табличные методы

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productListCell", for: indexPath)
            as! ProductListTableViewCell  //swiftlint:disable:this force_cast

        cell.textLabel?.text = productList[indexPath.row].name

        return cell
    }
    
    
    // MARK: - методы перехода
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "productDetailSegue",
            let indexPath = self.tableView.indexPathForSelectedRow {
            
            let destinationVC = segue.destination as! ProductDetailViewController //swiftlint:disable:this force_cast
            destinationVC.product = productList[indexPath.row]
        }
    }
    
    
    // MARK: - методы кнопок
    
    // TODO: переделать на реальный запрос на сервер
    // Кнопка Logout
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "loginVC")
            as! LoginViewController  //swiftlint:disable:this force_cast
        let key = UserDefaultsKey.isRegistration.rawValue
        userDefaults.set(false, forKey: key)
        track(.logout())
        
        DispatchQueue.main.async {
            self.present(
                viewController,
                animated: true,
                completion: nil)
        }
    }
    
}
