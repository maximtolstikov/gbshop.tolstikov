// Для работы с файлом хранения данных

import Foundation

struct PlistManager: BDManager {
    
    let fileManager: FileManager
    let directory: String
    let path: String
    var isFileCreated: Bool = false
    
    init() {
        self.fileManager = FileManager.default
        self.directory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true)[0] as String
        self.path = directory.appending("usersFromMoc.plist")
        self.isFileCreated = checkFileToSave()
    }

    // Принимает и записывает словарь с данными пользователя
    func write(for dict: [String: [String: Any]]) -> [String: Any] {
        
        guard let dictBD = getDictFromBD() else {
            let error =  "Неудается открыть файл базы данных!"
            print(error)
            return ["result": 0, "message": error]
        }
        
        let mutableDict = dictBD.mutableCopy() as! NSMutableDictionary
        if let key = dict.keys.first {
            mutableDict[key] = dict[key]
        }
        
        let success = mutableDict.write(toFile: path, atomically: true)
        
        let goodMessage = "Данные пользователя успешно сохранены!"
        let badMessage = "Данные пользователя сохранить не удалось!"
        
        if success {
            print(goodMessage)
            return ["result": 1, "message": goodMessage] as [String : Any]
        } else {
            print(badMessage)
            return ["result": 0, "message": badMessage] as [String : Any]
        }
    }

    
    // Возвращает словарь базы данных
    func getDict() -> [String: [String: Any]]? {
        
        guard let dict = getDictFromBD() else { return nil }
        
        return dict as? [String: [String: Any]]
    }
    
    
    //Достает из файла NSDictionary
    fileprivate func getDictFromBD() -> NSDictionary? {
        
        guard isFileCreated,
            let dict = NSDictionary(contentsOfFile: path)
            else { return nil }
        
        return dict
    }
    
    
    // Проверяет создан ли файл, если нет то создает его и добавляет в него пустой соловарь
    fileprivate func checkFileToSave() -> Bool{
        
        if (!fileManager.fileExists(atPath: path)) {
            
            var success: Bool
            let dictionary = [String: [String: Any]]()
            let plistContent = NSDictionary(dictionary: dictionary)
            success = plistContent.write(toFile: path, atomically: true)
            if success {
                print("file has been created!")
            }else{
                print("unable to create the file")
            }
            return success
        }
        return true
    }
}
