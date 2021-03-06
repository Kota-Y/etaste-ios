//
// FoodAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire



open class FoodAPI {
    /**
     Create Food.
     
     - parameter foodCreate: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createFood(foodCreate: FoodCreate? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createFoodWithRequestBuilder(foodCreate: foodCreate).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Food.
     - POST /food
     - parameter foodCreate: (body)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func createFoodWithRequestBuilder(foodCreate: FoodCreate? = nil) -> RequestBuilder<Void> {
        let path = "/food"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: foodCreate)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete Food.
     
     - parameter foodId: (path) Food Id. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteFood(foodId: Int64, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteFoodWithRequestBuilder(foodId: foodId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Food.
     - DELETE /food/{foodId}
     - parameter foodId: (path) Food Id. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteFoodWithRequestBuilder(foodId: Int64) -> RequestBuilder<Void> {
        var path = "/food/{foodId}"
        let foodIdPreEscape = "\(foodId)"
        let foodIdPostEscape = foodIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{foodId}", with: foodIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get Food.
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllFood(completion: @escaping ((_ data: Food?,_ error: Error?) -> Void)) {
        getAllFoodWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get Food.
     - GET /food
     - returns: RequestBuilder<Food> 
     */
    open class func getAllFoodWithRequestBuilder() -> RequestBuilder<Food> {
        let path = "/food"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Food>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get Food by ID.
     
     - parameter foodId: (path) Food Id. 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getFood(foodId: Int64, completion: @escaping ((_ data: FoodDetail?,_ error: Error?) -> Void)) {
        getFoodWithRequestBuilder(foodId: foodId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get Food by ID.
     - GET /food/{foodId}
     - parameter foodId: (path) Food Id. 
     - returns: RequestBuilder<FoodDetail> 
     */
    open class func getFoodWithRequestBuilder(foodId: Int64) -> RequestBuilder<FoodDetail> {
        var path = "/food/{foodId}"
        let foodIdPreEscape = "\(foodId)"
        let foodIdPostEscape = foodIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{foodId}", with: foodIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<FoodDetail>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
