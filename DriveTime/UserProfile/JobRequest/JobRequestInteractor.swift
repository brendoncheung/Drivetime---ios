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
    var worker = JobRequestWorker() // Make sure to only have one worker
    
    var fetchedresponse: JobRequest.fetchJobRequest.Response?
    
    func fetchJobRequest(email: String?) {
        
        worker = JobRequestWorker()
        worker.fetchJobRequests(email: email) { [unowned self] (response, error) in
            
            if let error = error {
                switch error {
                case .FailedToFetchEmptyJobRequests :
                    log.debug("Failed to fetch job requests")
                    self.presenter?.presentJobRequestsError(error: error)
                }
            }
            
            if let response = response {
                log.debug("Fetch job requests")
                self.fetchedresponse = response
                self.presenter?.presentJobRequests(response: response)
            }
        }
    }
    
    func acceptJobRequest(id: String?, email: String?) {
        log.debug("accepting job request")
        let acceptedResponse = fetchedresponse?.jobResponses?.filter {$0.id?.toString() == id}
        
        worker.acceptJobRequest(jobRequestObject: acceptedResponse?.first, email: email) { [unowned self] (isSuccess) in
            if (isSuccess) {
                self.fetchJobRequest(email: email)
            }
        }
//        usleep(1000000/2) // sleep for 0.5 sec for backend to catch up
//        fetchJobRequest(email: email)
    }
}
















