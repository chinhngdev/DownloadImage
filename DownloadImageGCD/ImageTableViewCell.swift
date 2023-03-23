//
//  ImageTableViewCell.swift
//  DownloadImageGCD
//
//  Created by tinhvan on 16/03/2023.
//  Tham khảo: https://cocoacasts.com/fm-3-download-an-image-from-a-url-in-swift

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var heavyImageView: UIImageView!
    var url: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Using the Data Struct to Download Images
    /// - Parameter url: image url
    func fetchImageUsingDataStruct(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.heavyImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    /// Using the URLSession API to Download Images
    /// - Parameter url: image url
    func fetchImageDataUsingUrlSession(url: URL) {
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self?.heavyImageView.image = UIImage(data: data)
                }
            }
        }
        
        dataTask.resume()
    }
}
