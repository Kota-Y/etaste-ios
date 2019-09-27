//
// StoreAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire



open class StoreAPI {
    /**
     Delete Store.
     
     - parameter storeId: (path) Store Id. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteStore(storeId: Int64, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteStoreWithRequestBuilder(storeId: storeId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete Store.
     - DELETE /store/{storeId}
     - parameter storeId: (path) Store Id. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteStoreWithRequestBuilder(storeId: Int64) -> RequestBuilder<Void> {
        var path = "/store/{storeId}"
        let storeIdPreEscape = "\(APIHelper.mapValueToPathItem(storeId))"
        let storeIdPostEscape = storeIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{storeId}", with: storeIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get Store by ID.
     
     - parameter storeId: (path) Store Id. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getStore(storeId: Int64, completion: @escaping ((_ data: Store?,_ error: Error?) -> Void)) {
        getStoreWithRequestBuilder(storeId: storeId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get Store by ID.
     - GET /store/{storeId}
     - parameter storeId: (path) Store Id. 
     - returns: RequestBuilder<Store> 
     */
    open class func getStoreWithRequestBuilder(storeId: Int64) -> RequestBuilder<Store> {
        var path = "/store/{storeId}"
        let storeIdPreEscape = "\(APIHelper.mapValueToPathItem(storeId))"
        let storeIdPostEscape = storeIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{storeId}", with: storeIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Store>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get StoreDetail by ID.
     
     - parameter storeId: (path) Store Id. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getStoreDetail(storeId: Int64, completion: @escaping ((_ data: StoreDetail?,_ error: Error?) -> Void)) {
        getStoreDetailWithRequestBuilder(storeId: storeId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get StoreDetail by ID.
     - GET /store/detail/{storeId}
     - parameter storeId: (path) Store Id. 
     - returns: RequestBuilder<StoreDetail> 
     */
    open class func getStoreDetailWithRequestBuilder(storeId: Int64) -> RequestBuilder<StoreDetail> {
        var path = "/store/detail/{storeId}"
        let storeIdPreEscape = "\(APIHelper.mapValueToPathItem(storeId))"
        let storeIdPostEscape = storeIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{storeId}", with: storeIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<StoreDetail>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
