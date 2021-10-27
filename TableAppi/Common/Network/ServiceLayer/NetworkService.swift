//
//  NetworkService.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 19.05.2021.
//

import Foundation
import Alamofire



final class NetworkService<Endpoint: EndpointProtocol> {

    init() {
      
        self.decoder = JSONDecoder()
      self.decoder.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.millisecondsSince1970
      
      let sessionConfiguration = URLSessionConfiguration.default
      sessionConfiguration.headers = .default
      
      self.alamofireManager = Alamofire.Session(configuration: sessionConfiguration)
      
    }

    private let decoder: JSONDecoder
    private let alamofireManager: Session
    
    
    func request<Response>(
      endpoint: Endpoint,
      completion: @escaping (Result<Response>) -> Void) where Response: Decodable {
      
      guard let baseUrl = endpoint.baseUrl else {
        completion(Result.failure(.noBaseUrl))
        return
      }

        
        decoder.keyDecodingStrategy = endpoint.keyDecodingStrategy
        
        let url = baseUrl.appendingPathComponent(endpoint.path)

        
        alamofireManager.request(url,
                                 encoding: endpoint.encoding,
                                 headers: endpoint.headers).response { [weak self] response in
                                    
                                  guard let self = self else { return }
                                  
                                  let result: Result<Response>
                                  
                                  defer {
                                    DispatchQueue.main.async {
                                      completion(result)
                                    }
                                  }
                                  
                                  guard let httpResponse = response.response else {
                                    result = Result.failure(APIError.noNetwork)
                                    return
                                  }
                                  
                                  guard (ServiceConstants.validCodes ~= httpResponse.statusCode) else {
                                    
                                    let serverError = self.createServerError(from: response)
                                    result = Result.failure(serverError)
                                    return
                                  }
                                  
                                  guard let data = response.data else {
                                    let serverError = self.createServerError(from: response)
                                    result = Result.failure(serverError)
                                    return
                                  }
                                  
                                  do {
                                    let object = try self.decoder.decode(Response.self, from: data)
                                    result = Result.success(object)
                                  } catch (let error) {
                                    NSLog(error.localizedDescription)
                                    result = Result.failure(.decodingError)
                                  }
                                 }
        
      }
        
        private func createServerError(from response: AFDataResponse<Data?>) -> APIError {
          
          guard let data = response.data else {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
          }
          
          do {
            let error = try decoder.decode(ParsableError.self, from: data)
            return APIError.parsableError(error)
            
          } catch {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
          }
        }
        
    }
