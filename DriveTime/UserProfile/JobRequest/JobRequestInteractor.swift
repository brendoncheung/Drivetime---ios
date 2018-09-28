//
//  JobRequestInteractor.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/18/18.
//  Copyright (c) 2018 Wing Sun Cheung. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol JobRequestBusinessLogic {
    func fetchJobRequest(email: String?)
    func acceptJobRequest(id: String?, email: String?)
}

protocol JobRequestDataStore {
    //var name: String { get set }
}

class JobRequestInteractor: JobRequestDataStore, JobRequestBusinessLogic {
    
    var presenter: JobRequestPresentationLogic?
    var worker: JobRequestWorker?
    
    var fetchedresponse: JobRequest.fetchJobRequest.Response?
    
    func fetchJobRequest(email: String?) {
        
        let worker = JobRequestWorker()
        worker.fetchJobRequests(email: email) { [unowned self] (response, error) in
            
            if let error = error {
                
                switch error {
                    
                    // MARK: - The error message should be managed by the presenter
                
                case .FailedToFetchJobRequests :
                    self.presenter?.presentJobRequestsError(message: "There are currently no jobs available")
                }
            }
            
            if let response = response {
                self.fetchedresponse = response
                self.presenter?.presentJobRequests(response: response)
            }
        }
    }
    
    func acceptJobRequest(id: String?, email: String?) {
        let worker = JobRequestWorker()
        let acceptedResponse = fetchedresponse?.jobResponses?.filter {$0.id == id}
        let isAcceptedJob =  worker.acceptJobRequest(jobRequestObject: acceptedResponse?.first, email: email)
        
        switch isAcceptedJob {
            
        case true:
            presenter?.presentRefreshJobRequestList()
        case false:
            presenter?.presentFailedJobRequestAccept()
        
        }
    }
}
















