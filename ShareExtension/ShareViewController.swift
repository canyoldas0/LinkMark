//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Can Yoldaş on 9.11.2022.
//

import UIKit
import Social
import SwiftUI

@objc(CustomShareNavigationController)
class CustomShareNavigationController: UINavigationController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        // 2: set the ViewControllers
        self.setViewControllers([CustomShareViewController()], animated: false)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

final class CustomShareViewController: UIViewController {
    
    var shareAddView: ShareAddView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1: Set the background and call the function to create the navigation bar
        self.view.backgroundColor = .systemGray
        setupNavBar()
        
        shareAddView = ShareAddView()
        
        let hostingController = UIHostingController(rootView: AddItemView())
        addChild(hostingController)
        
        view.addSubview(hostingController.view)
        
        /// Setup the contraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        /// Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)
    }

    // 2: Set the title and the navigation items
    private func setupNavBar() {
        self.navigationItem.title = "Save the Link!"

        let itemCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        self.navigationItem.setLeftBarButton(itemCancel, animated: false)

        let itemDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        self.navigationItem.setRightBarButton(itemDone, animated: false)
    }

    // 3: Define the actions for the navigation items
    @objc private func cancelAction () {
        let error = NSError(domain: "some.bundle.identifier", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error description"])
        extensionContext?.cancelRequest(withError: error)
    }

    @objc private func doneAction() {
        fillLabel()
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    private func fillLabel() {
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
                if let itemProvider = item.attachments?.first as? NSItemProvider {
                    if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                        itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (url, error) -> Void in
                            if let shareURL = url as? NSURL {
                                // send url to server to share the link
                                let string = "\(shareURL)"
                                if let pref = UserDefaults(suiteName: "group.trackLink") {
                                    pref.setValue(string, forKey: "keyForMySharableData")
                                }
//                                UserDefaults.standard.setValue(string, forKey: "keyForMySharableData")
                            }
                            self.extensionContext?.completeRequest(returningItems: [], completionHandler:nil)
                        })
                    }
                }
            }
    }
}
