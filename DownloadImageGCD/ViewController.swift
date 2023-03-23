//
//  ViewController.swift
//  DownloadImageGCD
//
//  Created by tinhvan on 16/03/2023.
//  Tham khảo: https://cocoacasts.com/fm-3-download-an-image-from-a-url-in-swift

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var imageURL = [
        "https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_1200m_africa_s.tif",
        "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg",
        "https://images.pexels.com/photos/12151398/pexels-photo-12151398.jpeg?cs=srgb&dl=pexels-jean-papillon-12151398.jpg&fm=jpg&w=640&h=852",
        "https://images.pexels.com/photos/6592160/pexels-photo-6592160.jpeg?cs=srgb&dl=pexels-olia-danilevich-6592160.jpg&fm=jpg&w=4000&h=6000"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        let imageTableViewCellNib = UINib(nibName: "ImageTableViewCell", bundle: nil)
        tableView.register(imageTableViewCellNib, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageURL.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else {
            return UITableViewCell()
        }
        cell.fetchImageUsingDataStruct(url: URL(string: imageURL[indexPath.row])!)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
