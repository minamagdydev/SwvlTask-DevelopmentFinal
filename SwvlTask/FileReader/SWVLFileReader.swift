//

//  FileReader.swift

//  SwvlTask

//

//  Created by lujin sherif  on 6/2/19.

//  Copyright © 2019 minamagdy. All rights reserved.

//



import Foundation



class SWVLFileReader: FileReader {
    
    
    
    private var filePath: URL
    
    
    
    init?(fileName: String, type: String) {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: type) else {
            
            return nil
            
        }
        
        filePath = URL(fileURLWithPath: path)
        
    }
    
    
    
    func getFileData(onSuccess: @escaping (Data) -> Void , onError: @escaping (Error) -> Void) {
        
        DispatchQueue.global().async { [weak self] in
            
            do {
                
                if let filePath = self?.filePath {
                    
                    let data = try Data(contentsOf:filePath)
                    
                    
                    
                    onSuccess(data)
                    
                }
                
            }
                
            catch (let error) {
                
                // Note:- this line of code is unneccessary because if the file is empty the data will not be nil
                
                onError(error)
                
            }
            
        }
        
    }
    
    
    
}

